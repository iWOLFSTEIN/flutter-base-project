part of 'language_bloc.dart';

sealed class LanguageState extends Equatable {
  const LanguageState({this.stateId});

  final int? stateId;

  @override
  List<Object> get props => [];
}

final class InitialLanguageState extends LanguageState {
  const InitialLanguageState();
}

final class ChangedLanguageState extends LanguageState {
  const ChangedLanguageState({required int stateId}) : super(stateId: stateId);
}
