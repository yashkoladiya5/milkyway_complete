import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController extends ChangeNotifier {
  bool _isOnline = true;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  NetworkController() {
    _checkConnectivity();

    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      _isOnline = results.any((result) => result != ConnectivityResult.none);
      notifyListeners();
    });
  }

  bool get isOnline => _isOnline;

  Future<void> _checkConnectivity() async {
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    _isOnline = results.any((result) => result != ConnectivityResult.none);
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
