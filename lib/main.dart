import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/di/injection.dart';
import 'package:myapp/main_cubit.dart';
import 'package:myapp/main_state.dart';
import 'package:myapp/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtilHelper.ensureScreenReady();
  await setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<MainCubit>(create: (_) => sl<MainCubit>())],
      child: ScreenUtilHelper.init(
        builder: (context, child) {
          context.initScreenUtil();
          return BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                supportedLocales: AppLocalizations.supportedLocales,
                themeMode: state.themeMode,
                locale: state.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute: AppRoutes.splashScreen,
              );
            },
          );
        },
      ),
    );
  }
}
