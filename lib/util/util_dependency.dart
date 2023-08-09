
import 'package:et_movie_tickets/util/http/access_token/token_provider_impl.dart';
import 'package:get/get.dart';
import 'helpers/device_info.dart';
import 'http/access_token/token_provider.dart';
import 'http/http_service.dart';
import 'http/http_service_impl.dart';

class UtilDependency {
  static var tokenProvider = Get.find<TokenProvider>();
  static var httpService = Get.find<HttpService>();
  static var currrentDeviceInfo = Get.find<CurrentDeviceInfo>();
  static Future init() async {
    Get.put<CurrentDeviceInfo>(CurrentDeviceInfo());
    Get.put<HttpService>(HttpServiceImpl());
    Get.put<TokenProvider>(TokenProviderImpl());
  }
}