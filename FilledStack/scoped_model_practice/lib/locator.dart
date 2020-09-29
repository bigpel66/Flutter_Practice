import 'package:get_it/get_it.dart';
import 'package:scoped_model_practice/services/services.dart';
import 'package:scoped_model_practice/scoped_models/scoped_models.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => FirebaseService());

  // ScopedModels
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  // Make Singleton
  // locator.registerFactory<FeedbackViewModel>(() => FeedbackViewModel());
  locator.registerSingleton(FeedbackViewModel());
}
