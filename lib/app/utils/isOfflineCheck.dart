import 'package:connectivity/connectivity.dart';

Future<bool> isOffline() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult == ConnectivityResult.none;
}
