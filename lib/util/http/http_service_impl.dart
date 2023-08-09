
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:et_movie_tickets/util/helpers/user_secure_storage.dart';
import 'package:http/retry.dart';
import '../helpers/app_shared_preferences.dart';
import '../util_dependency.dart';
import 'http_attrib_options.dart';
import 'http_service.dart';
import 'http_status_worth_retrying.dart';

class HttpServiceImpl extends HttpService {
  @override
  Future<String?> send(HttpAttribOptions httpAttribOptions) async {
    try {
      /*prepare header*/

      String contentType = 'application/json'; /*default content type*/

      switch (httpAttribOptions.serializationMethod) {
        case BodySerializationMethod.UrlEncoded:
          contentType = 'application/x-www-form-urlencoded';
          break;
        default:
      }

      /// Get the IpAddress based on requestType.

      var selectedLang =
          AppSharedPreferences.getLanguage()?.toUpperCase() ?? "EN";

      if (selectedLang == "AR") {
        selectedLang = "RA";
      }
      Map<String, String> header = {
        'Accept-Language': selectedLang,
        'Platform': Platform.isAndroid ? 'Android' : 'iOS',
        'Content-type': contentType,
        'ShowDateTimeEthiopianCalendar':
            AppSharedPreferences.getIsEthiopianCalenderEnabled() ?? false
                ? "true"
                : "false",
        'IsDevelopment':
            AppSharedPreferences.getIsDevelopment() ?? false ? "true" : "false",
        'DeviceModel': UtilDependency.currrentDeviceInfo.deviceModel ?? "",
        'RiskifiedSessionId':
            AppSharedPreferences.getRiskifiedSessionID() ?? "",
        'AppVersion': UtilDependency.currrentDeviceInfo.appVersion ?? "",
        'IPAddress': UtilDependency.currrentDeviceInfo.ipAddress ?? "",
        'Framework': 'Flutter',
        'IsNotificationEnabled':
            (AppSharedPreferences.getNotificationStatus() ?? false).toString(),
        'DeviceId': AppSharedPreferences.getDeviceId() ?? "",
      };
      bool isAuthorizationRequired = false;
      String authSchem = '';
      httpAttribOptions.headerAttribute?.forEach((key, value) {
        if (key.contains("Authorization")) {
          if (value.length < 10) isAuthorizationRequired = true;
          authSchem = value;
        }

        header.addAll({key: value});
      });

      /*then get access token if the request requires an authorization*/
      if (isAuthorizationRequired) {
        var accessToken = await UserSecureStorage.getAccessToken() ??
            await UtilDependency.tokenProvider.getToken();

        if (accessToken == null) return null;
        header.update(
            "Authorization", (value) => authSchem + ' ' + accessToken);
      }

      http.Response? response;
      var url = Uri.parse(httpAttribOptions.baseUrl + httpAttribOptions.path);

      var _client = RetryClient(http.Client(), retries: 2,
          when: (http.BaseResponse response) {
        return HttpStatusWorthRetrying.isWorthyRetry(response.statusCode);
      });

      if (httpAttribOptions.method == HttpMethods.GET) {
        response = await _client.get(url, headers: header).timeout(
            Duration(seconds: httpAttribOptions.timeoutDuration ?? 60));
      } else if (httpAttribOptions.method == HttpMethods.POST) {
        response = await _client
            .post(url,
                body: httpAttribOptions.body,
                headers: header,
                encoding: Encoding.getByName('utf-8'))
            .timeout(
                Duration(seconds: httpAttribOptions.timeoutDuration ?? 60));
      }

      if (response?.statusCode == 200) {
        return response?.body;
      } else if ((response?.statusCode == 401 || response?.statusCode == 403) &&
          isAuthorizationRequired == true) {
        /*refresh or get access token and re-try the request*/
        var accessToken = await UtilDependency.tokenProvider.getToken();

        if (accessToken == null) return null;
        header.update(
            "Authorization", (value) => authSchem + ' ' + accessToken);

        if (httpAttribOptions.method == HttpMethods.GET)
          response = await _client.get(url, headers: header);
        else if (httpAttribOptions.method == HttpMethods.POST) {
          response = await _client.post(url,
              body: httpAttribOptions.body,
              headers: header,
              encoding: Encoding.getByName('utf-8'));
        }
        return response?.body;
      }
    }
    // on SocketException catch (ex) {
    //   if (ex.message.toLowerCase().contains("failed host lookup") ?? false) {
    //     Message.noConnectionMessage();
    //   }
    // }
    catch (ex, stack) {
     // await logAsync(stack);
    }

    return null;
  }
}
