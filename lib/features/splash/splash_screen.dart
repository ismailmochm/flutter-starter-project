import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/main_cubit.dart';
import 'package:myapp/main_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              AppLocalizations.of(context)!.hello,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.primary,
                fontSize: AppSize.sp(12),
              ),
            ),

            BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                final isDark = state.themeMode == ThemeMode.dark;
                final isEnglish = state.locale == Locale('en');

                return Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      value: isDark,
                      onChanged: (value) {
                        context.read<MainCubit>().setTheme(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                    SwitchListTile(
                      title: const Text('English'),
                      subtitle: Text(isEnglish ? 'EN' : 'ID'),
                      value: isEnglish,
                      onChanged: (value) {
                        context.read<MainCubit>().setLocale(
                          value ? const Locale('en') : const Locale('id'),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
