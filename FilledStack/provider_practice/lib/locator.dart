import 'package:get_it/get_it.dart';
import 'package:provider_practice/services/services.dart';
import 'package:provider_practice/providers/providers.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Service as a lazy singleton
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => Router());

  // states represented to a model as a factory
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
