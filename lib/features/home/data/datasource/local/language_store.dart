import 'dart:convert';

import 'package:flutter_base_project/config/config.dart';
import 'package:flutter_base_project/config/languages/language.dart';
import 'package:flutter_base_project/core/constants/app_constants.dart';
import 'package:flutter_base_project/features/home/data/managers/local/local_storage.dart';

class LanguageStore {
  final LocalStorageManager _manager;
  const LanguageStore(this._manager);

  Language getLanguage() {
    final String? storedLanguage =
        _manager.getString(key: AppConstants.language);
    if (storedLanguage == null) {
      return Config.defaultLanguage;
    }
    return Language.fromJson(jsonDecode(storedLanguage));
  }

  Future<void> setLanguage({required Language language}) async {
    await _manager.setString(
        key: AppConstants.language, value: jsonEncode(language.toJson()));
  }
}
