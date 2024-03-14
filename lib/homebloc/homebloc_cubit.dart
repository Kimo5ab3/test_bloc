import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/utils/enum_theme.dart';

part 'homebloc_state.dart';

class MainBlocCubit extends Cubit<MainBlocState> {
  MainBlocCubit()
      : super(MainInitialState(
          language: 'ITALIAN',
          theme: ThemeType.dark,
        ));

  void changeTheme({required ThemeType theme}){
    log('THEME: $theme');
    emit(MainNewThemeState(theme: theme));
  }

  void changeLanguage({required String language}){
    emit(MainNewLanguageState(language: language));
  }
}




