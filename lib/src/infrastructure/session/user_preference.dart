import 'dart:convert';

import 'package:expense_tracker/src/infrastructure/session/model/user_session.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserPreference {
  static const String key = "user";
  final FlutterSecureStorage _secureStorage;
  UserPreference(this._secureStorage);
  Future<void> setData(UserSession data) async {
    final encoded = jsonEncode(data);
    await _secureStorage.write(key: key, value: encoded);
  }

  Future<UserSession?> getData() async {
    final data = await _secureStorage.read(key: key);
    if (data != null) {
      final Map<String, dynamic> json = jsonDecode(data);
      return UserSession.fromJson(json);
    }
    return null;
  }

  Future<void> deleteData() async {
    await _secureStorage.delete(key: key);
  }
}
