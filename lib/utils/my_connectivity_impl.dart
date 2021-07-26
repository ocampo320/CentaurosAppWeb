import 'package:connectivity/connectivity.dart';

import 'my_connectivity.dart';

class MyConnectivityImpl implements MyConnectivity {
  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return Connectivity().checkConnectivity();
  }
}
