// Import necessary libraries
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Define NetworkInfo interface (if not already defined)
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

// Define NetworkInfoImpl class
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

