
import 'package:et_movie_tickets/util/helpers/keys.dart';

import '../../helpers/app_shared_preferences.dart';
import '../http_attrib_options.dart';

class TokenProviderHttpAttribute extends HttpAttribOptions {
  TokenProviderHttpAttribute(Object body)
      : super(
            baseUrl: AppSharedPreferences.getMicroServiceUrl() ?? Keys.prodMicroServiceUrl,
            path: '/connect/token',
            method: HttpMethods.POST,
            body: body,
            serializationMethod: BodySerializationMethod.UrlEncoded,
            headerAttribute: {
              // 'Accept-Language': 'EN',
              // 'Platform': Platform.isAndroid ? 'Android' : 'iOS',
              // 'IsDevelopment': AppSharedPreferences.getIsDevelopment() == true
              //     ? 'CERT'
              //     : 'PROD'
            });
}
