
import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CurrentDeviceInfo {
  static CurrentDeviceInfo? _instance;

  static CurrentDeviceInfo get instance => _instance ??= CurrentDeviceInfo();

  String? deviceModel;
  String platforms = Platform.operatingSystem;
  String? appVersion;
  String? ipAddress;
  int? androidVersion;
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static init() async {
    _instance = CurrentDeviceInfo();
    await _instance?.getDeviceInfo();
  }

  getDeviceInfo() async {
    try {
      Ipify.ipv4().then((value){
          ipAddress = value;
      });
      var platform = await PackageInfo.fromPlatform();
      if (Platform.isAndroid) {
        var androidInfo = await _deviceInfo.androidInfo;
        deviceModel = androidInfo.model.toString();
        androidVersion = androidInfo.version.sdkInt;
      } else {
        var iOSInfo = await _deviceInfo.iosInfo;
        deviceModel = iOSInfo.utsname.machine.toString();
      }
      appVersion = platform.version;
    } catch (ex, stack) {
      //await ex.logAsync(stack);
      return null;
    }
  }
}
