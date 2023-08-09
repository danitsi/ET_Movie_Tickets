

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();
  static const _KeyUsername = 'username';
  static const _Password = 'password';

  static const _accessToken = "_accessToken";


  static Future setUsername(String? username) async =>
      await _storage.write(key: _KeyUsername, value: username);
  static Future<String?> getUsername() async =>
      await _storage.read(key: _KeyUsername);

  static Future setPassword(String? password) async =>
      await _storage.write(key: _Password, value: password);
  static Future<String?> getPassword() async =>
      await _storage.read(key: _Password);

  static Future setAccessToken(String value) async =>
      await _storage.write(key: _accessToken, value: value);
  static Future<String?> getAccessToken() => _storage.read(key: _accessToken);

}
