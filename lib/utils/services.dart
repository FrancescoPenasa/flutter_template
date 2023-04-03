import 'package:get_it/get_it.dart';

import '../core/services/logger_service.dart';

final services = GetIt.instance;

void setUpServices() {
  // shared preferences
  services.registerSingleton<SharedStorage>(SharedStorage());
  services.get<SharedStorage>().init();

  // secure storage
  services.registerLazySingleton<SecureStorage>(() => SecureStorage());

  // url launcher
  // services.registerLazySingleton<UrlLauncherService>(() => UrlLauncherService());
  
  // logger
  services.registerLazySingleton<Logger>(() => ConsoleLogger());
  // serviceLocator.registerLazySingleton<Logger>(() => FileLogger());
}
