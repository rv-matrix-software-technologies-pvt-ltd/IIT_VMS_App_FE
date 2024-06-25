import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static const _loginId = 'LoginSessionToken';
  static const _userId = 'userID';
  static const _buildingID = 'buildingID';
  static const _buildingName = 'buildingName';
  static const _userType = 'userType';

  static Future setLogintoken(String token) async =>
      await _storage.write(key: _loginId, value: token);

  static Future<String?> getLoginToken() async =>
      await _storage.read(key: _loginId);

  static Future setUserId(String token) async =>
      await _storage.write(key: _userId, value: token);

  static Future<String?> getUserId() async =>
      await _storage.read(key: _userId);

  static Future setUserType(String token) async =>
      await _storage.write(key: _userType, value: token);

  static Future<String?> getUserType() async =>
      await _storage.read(key: _userType);

  static Future deleteStoredPreference(String keyword) async =>
      await _storage.delete(key: keyword);
}
