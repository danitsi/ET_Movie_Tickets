
import 'dart:convert';
import 'package:et_movie_tickets/util/helpers/user_secure_storage.dart';
import 'package:et_movie_tickets/util/models/access_token/access_token_request.dart';
import 'package:et_movie_tickets/util/models/access_token/access_token_response.dart';
import '../../util_dependency.dart';
import 'token_provider.dart';
import 'token_provider_http_attribute.dart';

class TokenProviderImpl extends TokenProvider {

  @override
  Future<String?> getToken() async {
    var accessTokenRequest = AccessTokenRequest()
      ..clientId = 'client'
      ..clientSecret = 'secret'
      ..grantType = 'client_credentials'
      ..scope = 'scopes.sample.api';

    final Map<String, dynamic> request =
        json.decode(jsonEncode(accessTokenRequest));

    var response = await UtilDependency.httpService
        .send(TokenProviderHttpAttribute(request));
    if (response != null && response.isNotEmpty) {
      var accessToken =
          AccessTokenResponse.fromJson(jsonDecode(response)).accessToken;
      if (accessToken != null) {
        await UserSecureStorage.setAccessToken(accessToken);
      }
      return accessToken;
    }
    return null;
  }

}
