import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class BackendApi {
  BackendApi._();

  static String get baseUrl {
    // We use 127.0.0.1 for Android to allow ADB port forwarding (adb reverse tcp:5001 tcp:5001)
    // to work seamlessly on both physical Android devices and emulators.
    final host = kIsWeb
        ? 'localhost'
        : (Platform.isAndroid ? '127.0.0.1' : 'localhost');
    return 'http://$host:5001/api';
  }

  static Uri _uri(String path, [Map<String, dynamic>? queryParameters]) {
    final uri = Uri.parse('$baseUrl$path');
    if (queryParameters == null || queryParameters.isEmpty) {
      return uri;
    }

    final filtered = <String, String>{};
    queryParameters.forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        filtered[key] = value.toString();
      }
    });
    return uri.replace(queryParameters: filtered);
  }

  static Map<String, String> get _jsonHeaders => {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
      };

  static Future<Map<String, dynamic>> getJson(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final uri = _uri(path, queryParameters);
    print(">>> [BackendApi GET] Request URI: $uri");
    try {
      final response = await http.get(uri);
      print("<<< [BackendApi GET] Response: Code=${response.statusCode}, Body=${response.body}");
      return _decode(response);
    } catch (e) {
      print("!!! [BackendApi GET] Exception: $e");
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> postJson(String path,
      {Map<String, dynamic>? body}) async {
    final uri = _uri(path);
    print(">>> [BackendApi POST] Request URI: $uri, Body: $body");
    try {
      final response = await http.post(
        uri,
        headers: _jsonHeaders,
        body: jsonEncode(body ?? {}),
      );
      print("<<< [BackendApi POST] Response: Code=${response.statusCode}, Body=${response.body}");
      return _decode(response);
    } catch (e) {
      print("!!! [BackendApi POST] Exception: $e");
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> putJson(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    final uri = _uri(path, queryParameters);
    print(">>> [BackendApi PUT] Request URI: $uri, Body: $body");
    try {
      final response = await http.put(
        uri,
        headers: _jsonHeaders,
        body: jsonEncode(body ?? {}),
      );
      print("<<< [BackendApi PUT] Response: Code=${response.statusCode}, Body=${response.body}");
      return _decode(response);
    } catch (e) {
      print("!!! [BackendApi PUT] Exception: $e");
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> patchJson(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    final uri = _uri(path, queryParameters);
    print(">>> [BackendApi PATCH] Request URI: $uri, Body: $body");
    try {
      final response = await http.patch(
        uri,
        headers: _jsonHeaders,
        body: jsonEncode(body ?? {}),
      );
      print("<<< [BackendApi PATCH] Response: Code=${response.statusCode}, Body=${response.body}");
      return _decode(response);
    } catch (e) {
      print("!!! [BackendApi PATCH] Exception: $e");
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> deleteJson(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final uri = _uri(path, queryParameters);
    print(">>> [BackendApi DELETE] Request URI: $uri");
    try {
      final response = await http.delete(uri);
      print("<<< [BackendApi DELETE] Response: Code=${response.statusCode}, Body=${response.body}");
      return _decode(response);
    } catch (e) {
      print("!!! [BackendApi DELETE] Exception: $e");
      rethrow;
    }
  }

  static MediaType _getMediaTypeForPath(String filePath) {
    final pathLower = filePath.toLowerCase();
    if (pathLower.endsWith('.png')) {
      return MediaType('image', 'png');
    } else if (pathLower.endsWith('.webp')) {
      return MediaType('image', 'webp');
    } else if (pathLower.endsWith('.gif')) {
      return MediaType('image', 'gif');
    }
    return MediaType('image', 'jpeg');
  }

  static Future<Map<String, dynamic>> uploadFile({
    required String userId,
    required File file,
  }) async {
    final uri = _uri('/users/$userId/profile-image');
    print(">>> [BackendApi UPLOAD] Request URI: $uri, File: ${file.path}");
    try {
      final request = http.MultipartRequest('POST', uri);
      final multipartFile = await http.MultipartFile.fromPath(
        'image',
        file.path,
        contentType: _getMediaTypeForPath(file.path),
      );
      request.files.add(multipartFile);
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print("<<< [BackendApi UPLOAD] Response: Code=${response.statusCode}, Body=${response.body}");
      return _decode(response);
    } catch (e) {
      print("!!! [BackendApi UPLOAD] Exception: $e");
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> sendAiChatMessage({
    required String message,
    required List<Map<String, String>> history,
  }) async {
    return postJson('/ai/chat', body: {
      'message': message,
      'history': history,
    });
  }

  static Future<Map<String, dynamic>> scanBillWithAi({
    required File file,
  }) async {
    final uri = _uri('/ai/scan-bill');
    print(">>> [BackendApi SCAN BILL] Request URI: $uri, File: ${file.path}");
    try {
      final request = http.MultipartRequest('POST', uri);
      final multipartFile = await http.MultipartFile.fromPath(
        'image',
        file.path,
        contentType: _getMediaTypeForPath(file.path),
      );
      request.files.add(multipartFile);
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print("<<< [BackendApi SCAN BILL] Response: Code=${response.statusCode}, Body=${response.body}");
      return _decode(response);
    } catch (e) {
      print("!!! [BackendApi SCAN BILL] Exception: $e");
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getAiAdvisorInsights(String userId) async {
    return getJson('/ai/advisor', queryParameters: {'userId': userId});
  }

  static Map<String, dynamic> _decode(http.Response response) {
    final body = response.body.isEmpty ? '{}' : response.body;
    try {
      final decoded = jsonDecode(body);
      print("<<< [BackendApi _decode] Successfully decoded JSON response.");
      if (decoded is Map<String, dynamic>) {
        if (response.statusCode >= 400) {
          return {
            ...decoded,
            'httpStatus': response.statusCode,
          };
        }
        return decoded;
      }
      return {
        'success': response.statusCode < 400,
        'data': decoded,
        'httpStatus': response.statusCode,
      };
    } catch (e) {
      print("!!! [BackendApi _decode] Failed to parse JSON: $e, Raw body: $body");
      return {
        'success': response.statusCode < 400,
        'rawBody': body,
        'httpStatus': response.statusCode,
      };
    }
  }
}
