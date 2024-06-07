import 'package:flutter_base_project/features/home/data/datasource/local/theme_store.dart';
import 'package:flutter_base_project/features/home/domain/repositories/theme.dart';

class ThemeRepoImpl implements ThemeRepo {
  late final ThemeStore _themeStore;
  ThemeRepoImpl(this._themeStore);

  @override
  String getTheme() {
    return _themeStore.getTheme();
  }

  @override
  Future<void> setTheme({required String theme}) async {
    await _themeStore.setTheme(theme: theme);
  }
}
