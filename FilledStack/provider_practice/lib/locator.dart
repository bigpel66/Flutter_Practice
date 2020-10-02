import 'package:get_it/get_it.dart';
import 'package:provider_practice/services/services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Both services moved to MultiProivder to maintain them globally with detecting its state changes
  // locator.registerLazySingleton(() => Api());
  // locator.registerLazySingleton(() => AuthenticationService());
  // locator.registerLazySingleton(() => PostService());

  // Service as a lazy singleton
  locator.registerLazySingleton(() => Router());

  // Provider use context, so GetIt instance cannot include Models
  // states represented to a model as a factory
  // locator.registerFactory(() => LoginModel());
  // locator.registerFactory(() => PostsModel());
  // locator.registerFactory(() => CommentsModel());
}
