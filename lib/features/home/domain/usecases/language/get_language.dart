import 'package:flutter_base_project/config/languages/language.dart';
import 'package:flutter_base_project/core/usecases/usecase.dart';
import 'package:flutter_base_project/features/home/domain/repositories/language.dart';

class GetLanguageUseCase implements UseCase<Language> {
  final LanguageRepo _repo;
  const GetLanguageUseCase(this._repo);

  @override
  Language call() {
    return _repo.getLanguage();
  }
}
