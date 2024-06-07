import 'package:flutter_base_project/config/languages/language.dart';
import 'package:flutter_base_project/features/home/data/datasource/local/language_store.dart';
import 'package:flutter_base_project/features/home/domain/repositories/language.dart';

class LanguageRepoImpl implements LanguageRepo {
  late final LanguageStore _languageStore;
  LanguageRepoImpl(this._languageStore);

  @override
  Language getLanguage() {
    return _languageStore.getLanguage();
  }

  @override
  Future<void> setLanguage({required Language language}) async {
    await _languageStore.setLanguage(language: language);
  }
}
