import 'package:app_core/app_core.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/main_cubit.dart';

final sl = GetIt.instance;

Future<void> setupInjection() async {
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton<MainCubit>(() => MainCubit());
}
