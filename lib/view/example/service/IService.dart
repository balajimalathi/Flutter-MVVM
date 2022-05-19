import 'package:buildbase/view/example/bottom_nav/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class IService {
  // final INetworkManager manager;
  //
  // ILoginService(this.manager);
  Future<String> getServiceData();
  Future<Either<String, List<Datum>>> getAllUsers();
  Future<List<Datum>> getAll();
}
