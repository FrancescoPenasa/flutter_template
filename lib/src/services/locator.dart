import 'package:get_it/get_it.dart';

import 'logger.dart';
import 'secure_storage.dart';
import 'shared_storage.dart';

final serviceLocator = GetIt.instance;

void setUpServices() {
  // shared preferences
  serviceLocator.registerSingleton<SharedStorage>(SharedStorage());
  serviceLocator.get<SharedStorage>().init();

  // secure storage
  serviceLocator.registerLazySingleton<SecureStorage>(() => SecureStorage());

  // logger
  serviceLocator.registerLazySingleton<Logger>(() => ConsoleLogger());
}