import 'package:cloud_firestore/cloud_firestore.dart';

import 'backend_api.dart';

class AuthLegacyBridge {
  AuthLegacyBridge._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static List<String> _candidateValues(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return const [];
    }

    final candidates = <String>{trimmed};
    if (trimmed.startsWith('+91')) {
      candidates.add(trimmed.replaceFirst('+91', ''));
    } else if (RegExp(r'^\d{10}$').hasMatch(trimmed)) {
      candidates.add('+91$trimmed');
    }

    return candidates.toList();
  }

  static Future<Map<String, dynamic>?> _lookupLegacyUser(String value) async {
    final candidates = _candidateValues(value);
    if (candidates.isEmpty) {
      return null;
    }

    for (final candidate in candidates) {
      final emailResult = await _firestore
          .collection('user')
          .where('email', isEqualTo: candidate)
          .limit(1)
          .get();
      if (emailResult.docs.isNotEmpty) {
        return {
          ...emailResult.docs.first.data(),
          '_id': emailResult.docs.first.id,
        };
      }

      final mobileResult = await _firestore
          .collection('user')
          .where('mobileNumber', isEqualTo: candidate)
          .limit(1)
          .get();
      if (mobileResult.docs.isNotEmpty) {
        return {
          ...mobileResult.docs.first.data(),
          '_id': mobileResult.docs.first.id,
        };
      }
    }

    return null;
  }

  static Map<String, dynamic> _backendRegisterBody(Map<String, dynamic> legacyUser) {
    final password = legacyUser['password']?.toString() ?? '';
    final mobileNumber = legacyUser['mobileNumber']?.toString() ?? '';

    return {
      'name': legacyUser['name']?.toString() ?? '',
      'area': legacyUser['area']?.toString() ?? '',
      'address': legacyUser['address']?.toString() ?? '',
      'pincode': legacyUser['pincode'],
      'mobileNumber': mobileNumber,
      'email': legacyUser['email']?.toString() ?? '',
      'password': password,
      'confirmPassword': legacyUser['confirmPassword']?.toString() ?? password,
      'image': legacyUser['image']?.toString() ?? '',
      'lastName': legacyUser['lastName']?.toString() ?? '',
    };
  }

  static Future<Map<String, dynamic>> syncLegacyUserToBackend(
    Map<String, dynamic> legacyUser,
  ) async {
    final lookupValue = legacyUser['mobileNumber']?.toString().trim().isNotEmpty == true
        ? legacyUser['mobileNumber'].toString()
        : legacyUser['email']?.toString() ?? '';

    if (lookupValue.isEmpty) {
      return {
        'success': false,
        'message': 'Legacy account is missing email and mobile number',
      };
    }

    final backendLookup = await BackendApi.getJson(
      '/auth/lookup',
      queryParameters: {'value': lookupValue},
    );

    if (backendLookup['success'] == true && backendLookup['userId'] != null) {
      final password = legacyUser['password']?.toString() ?? '';
      if (password.isNotEmpty) {
        await BackendApi.putJson(
          '/users/${backendLookup['userId']}/password',
          body: {
            'password': password,
            'confirmPassword': password,
          },
        );
      }
      return backendLookup;
    }

    return BackendApi.postJson(
      '/auth/register',
      body: _backendRegisterBody(legacyUser),
    );
  }

  static Future<Map<String, dynamic>> loginWithFallback({
    required String mobileOrEmail,
    required String password,
  }) async {
    final backendResponse = await BackendApi.postJson(
      '/auth/login',
      body: {
        'mobileNumber': mobileOrEmail,
        'password': password,
      },
    );

    if (backendResponse['success'] == true) {
      return backendResponse;
    }

    final legacyUser = await _lookupLegacyUser(mobileOrEmail);
    if (legacyUser == null) {
      return backendResponse;
    }

    final legacyPassword = legacyUser['password']?.toString() ?? '';
    if (legacyPassword.isNotEmpty && legacyPassword != password) {
      return backendResponse;
    }

    final syncResponse = await syncLegacyUserToBackend(legacyUser);
    if (syncResponse['success'] != true) {
      return backendResponse;
    }

    return BackendApi.postJson(
      '/auth/login',
      body: {
        'mobileNumber': mobileOrEmail,
        'password': password,
      },
    );
  }

  static Future<Map<String, dynamic>> lookupOrSyncUser(String value) async {
    final backendLookup = await BackendApi.getJson(
      '/auth/lookup',
      queryParameters: {'value': value},
    );

    if (backendLookup['success'] == true) {
      return backendLookup;
    }

    final legacyUser = await _lookupLegacyUser(value);
    if (legacyUser == null) {
      return backendLookup;
    }

    return syncLegacyUserToBackend(legacyUser);
  }
}
