import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:myapp/main_cubit.dart';
import 'package:myapp/main_state.dart';

void main() {
  group('MainCubit', () {
    late MainCubit cubit;

    setUp(() {
      cubit = MainCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is system theme and en locale', () {
      expect(
        cubit.state,
        const MainState(themeMode: ThemeMode.system, locale: Locale('en')),
      );
    });

    blocTest<MainCubit, MainState>(
      'emit updated themeMode when setTheme is called',
      build: () => MainCubit(),
      act: (cubit) => cubit.setTheme(ThemeMode.dark),
      expect: () => [
        const MainState(themeMode: ThemeMode.dark, locale: Locale('en')),
      ],
    );

    blocTest<MainCubit, MainState>(
      'emit updated locale when setLocale is called',
      build: () => MainCubit(),
      act: (cubit) => cubit.setLocale(const Locale('id')),
      expect: () => [
        const MainState(themeMode: ThemeMode.system, locale: Locale('id')),
      ],
    );

    blocTest<MainCubit, MainState>(
      'keep locale when theme is changed',
      build: () => MainCubit(),
      act: (cubit) => cubit.setTheme(ThemeMode.light),
      expect: () => [
        const MainState(themeMode: ThemeMode.light, locale: Locale('en')),
      ],
    );

    blocTest<MainCubit, MainState>(
      'keep theme when locale is changed',
      build: () => MainCubit(),
      act: (cubit) => cubit.setLocale(const Locale('fr')),
      expect: () => [
        const MainState(themeMode: ThemeMode.system, locale: Locale('fr')),
      ],
    );
  });
}
