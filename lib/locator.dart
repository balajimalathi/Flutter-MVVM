import 'package:buildbase/core/network/network_manager.dart';
import 'package:buildbase/view/example/example.service.dart';
import 'package:buildbase/view/example/example_view_model.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  // API - Services
  locator.registerLazySingleton(() => ExampleService());
  
  // View models
  locator.registerFactory(() => ExampleViewModel());

  // Dio
  locator.registerFactory(() => NetworkManager());
}
