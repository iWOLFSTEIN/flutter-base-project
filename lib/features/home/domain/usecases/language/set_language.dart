import 'package:flutter_base_project/config/languages/language.dart';
import 'package:flutter_base_project/core/usecases/usecase_async.dart';
import 'package:flutter_base_project/features/home/domain/repositories/language.dart';

class SetLanguageUseCase implements UseCaseAsync<void> {
  final LanguageRepo _repo;
  const SetLanguageUseCase(this._repo);

  @override
  Future<void> call({Language? language}) async {
    return _repo.setLanguage(language: language!);
  }
}
