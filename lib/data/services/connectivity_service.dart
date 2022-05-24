import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService{
  final _connectivity = Connectivity();
  final connectivityStream = StreamController<ConnectivityResult>();

  ConnectivityService(){
    print('check');
    _connectivity.onConnectivityChanged.listen((event) {
      connectivityStream.add(event);
    });
  }
}