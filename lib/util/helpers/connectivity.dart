import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:et_movie_tickets/util/helpers/user_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../util_dependency.dart';
import 'message.dart';

class Internet {
  late StreamSubscription<ConnectivityResult> listener;

  static final Internet _instance = Internet._internal();
  Internet._internal();

  static Internet getInstance() => _instance;

  late bool _isConnected = false;
  static bool isConnected() => getInstance()._isConnected;
  final Connectivity _connectivity = Connectivity();

  initialize() async {
    listener = _connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      checkConnectivity(result);
    });
    checkConnectivity(await _connectivity.checkConnectivity());
  }

  checkConnectivity(ConnectivityResult result) async {
    if (result != ConnectivityResult.none &&
        result != ConnectivityResult.bluetooth) {
      _isConnected = true;
      InternetConnectionChecker().hasConnection.then((val) {
        if (!val) {
          _isConnected = false;
          Message.noConnectionMessage();
        }
      });

      InternetConnectionChecker().onStatusChange.listen((status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            _isConnected = true;
            break;
          case InternetConnectionStatus.disconnected:
            _isConnected = false;
            Message.noConnectionMessage();
            break;
        }
      });

      if (_isConnected) {
        var accessToken = await UserSecureStorage.getAccessToken();
        if (accessToken == null || JwtDecoder.isExpired(accessToken)) {
          await UtilDependency.tokenProvider.getToken();
        }

        //AppVersionImpl.checkAppVersion();
      }
    } else {
      _isConnected = false;
      Message.noConnectionMessage();
    }
  }
}
