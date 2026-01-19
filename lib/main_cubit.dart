import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
    : super(const MainState(themeMode: ThemeMode.system, locale: Locale('en')));

  void setTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }

  void setLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }
}
