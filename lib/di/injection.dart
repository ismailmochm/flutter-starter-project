import 'package:app_core/app_core.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  sl.registerLazySingleton(() => ApiClient());
}
