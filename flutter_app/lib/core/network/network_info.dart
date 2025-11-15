import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker? connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected {
    // On web, assume connected (browser handles network state)
    if (kIsWeb) {
      return Future.value(true);
    }
    // On mobile/desktop, use the connection checker
    return connectionChecker?.hasConnection ?? Future.value(true);
  }
}
