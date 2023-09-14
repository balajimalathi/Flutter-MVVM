import 'package:buildbase/core/network/network_manager.dart';
import 'package:buildbase/view/example/example.impl.dart';
import 'package:buildbase/view/example/example_view_model.dart';
import 'package:get_it/get_it.dart';

// Represents compile-time dependency injection
GetIt locator = GetIt.instance;

void setupLocator() {
  // API - Services
  locator.registerLazySingleton(() => ExampleRepositoryImpl());
  
  // View models
  locator.registerFactory(() => ExampleViewModel());

  // Dio
  locator.registerFactory(() => NetworkManager());
}
