import 'package:flutter_base_project/core/usecases/usecase.dart';
import 'package:flutter_base_project/features/home/domain/repositories/theme.dart';

class GetThemeUseCase implements UseCase<String> {
  final ThemeRepo _repo;
  const GetThemeUseCase(this._repo);

  @override
  String call() {
    return _repo.getTheme();
  }
}
