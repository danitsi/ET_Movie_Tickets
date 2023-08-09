import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(
  explicitToJson: true,
)
class AccessTokenRequest {
  @JsonKey(name: 'Client_Id')
  String? clientId;
  @JsonKey(name: 'Client_Secret')
  String? clientSecret;
  @JsonKey(name: 'Grant_type')
  String? grantType;
  @JsonKey(name: 'Scope')
  String? scope;

  AccessTokenRequest();
  factory AccessTokenRequest.fromJson(Map<String, dynamic> json) =>
      AccessTokenRequest()
        ..clientId = json['Client_Id'] as String?
        ..clientSecret = json['Client_Secret'] as String?
        ..grantType = json['Grant_type'] as String?
        ..scope = json['Scope'] as String?;

  Map<String, dynamic> toJson() => {
        'Client_Id': clientId,
        'Client_Secret': clientSecret,
        'Grant_type': grantType,
        'Scope': scope,
      };
}
