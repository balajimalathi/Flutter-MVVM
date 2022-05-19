import 'package:buildbase/core/init/database/db_provider.dart';
import 'package:buildbase/core/init/network/network_manager.dart';
import 'package:buildbase/view/example/bottom_nav/view_model/view_model.dart';
import 'package:buildbase/view/example/database/user_dao.dart';
import 'package:buildbase/view/example/tab/view_model/view_model.dart';
import 'package:get_it/get_it.dart';

import '../../view/example/service/service.dart'; 

GetIt locator = GetIt.instance;

void setupLocator() {
  // API - Services
  locator.registerLazySingleton(() => Service());

  // Viewmodels
  locator.registerFactory(() => TabViewModel());
  locator.registerFactory(() => BottomViewModel()); 

  // Dio
  locator.registerFactory(() => NetworkManager());
  locator.registerFactory(() => UserDao()); 

  


}
