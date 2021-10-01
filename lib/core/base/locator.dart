import 'package:buildbase/core/init/network/network_manager.dart';
import 'package:buildbase/view/authenticate/login/service/login_service.dart';
import 'package:buildbase/view/authenticate/login/view_model/login_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // API - Services
  locator.registerLazySingleton(() => LoginService());

  // Viewmodels
  locator.registerFactory(() => LoginViewModel());

  // Dio
  locator.registerFactory(() => NetworkManager());

}
