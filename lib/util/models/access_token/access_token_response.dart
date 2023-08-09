import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(
  explicitToJson: true,
)
class AccessTokenResponse {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'expires_in')
  int expiresIn = 0;
  @JsonKey(name: 'token_type')
  String? tokenType;
  @JsonKey(name: 'scope')
  String? scope;

  AccessTokenResponse();
  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      AccessTokenResponse()
        ..accessToken = json['access_token'] as String?
        ..expiresIn = json['expires_in'] as int
        ..tokenType = json['token_type'] as String?
        ..scope = json['scope'] as String?;

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'expires_in': expiresIn,
        'token_type': tokenType,
        'scope': scope,
      };
}
