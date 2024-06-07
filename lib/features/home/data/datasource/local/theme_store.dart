import 'package:flutter_base_project/core/constants/app_constants.dart';
import 'package:flutter_base_project/features/home/data/managers/local/local_storage.dart';

class ThemeStore {
  final LocalStorageManager _manager;
  const ThemeStore(this._manager);

  String getTheme() {
    return _manager.getString(key: AppConstants.theme) ?? AppConstants.light;
  }

  Future<void> setTheme({required String theme}) async {
    await _manager.setString(key: AppConstants.theme, value: theme);
  }
}
