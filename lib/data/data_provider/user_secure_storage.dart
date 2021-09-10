import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();
  static const _keyJwt = 'jwt';
  static Future setToken({String? token}) async {
    await _storage.write(key: _keyJwt, value: token);
  }

  static Future<String?> getToken() async {
    
    return await _storage.read(key: _keyJwt);
  }
}
