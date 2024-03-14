part of 'homebloc_cubit.dart';

@immutable
abstract class MainBlocState {}

class MainInitialState extends MainBlocState {
  final String? language;
  final ThemeType? theme;

  MainInitialState({
    this.theme,
    this.language,
  });
}

class MainNewLanguageState extends MainBlocState {
  final String language;

  MainNewLanguageState({required this.language});
}

class MainNewThemeState extends MainBlocState {
  final ThemeType theme;

  MainNewThemeState({required this.theme});
}
