import 'package:connectivity_plus/connectivity_plus.dart';

abstract class Netwokinfo {
  Future<bool> get isConnected;
}

class NetworkIfnoImpl implements Netwokinfo {
  final Connectivity connectionChecker;

  NetworkIfnoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => checkNetworkConnection();

  Future<bool> checkNetworkConnection() async {
    final List<ConnectivityResult> connectivityResult = await connectionChecker.checkConnectivity();

  //  print(connectivityResult);

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      return true;
    } else {
      return false;
    }
  }
}
