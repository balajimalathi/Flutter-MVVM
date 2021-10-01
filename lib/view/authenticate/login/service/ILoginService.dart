import 'package:buildbase/view/authenticate/login/model/login_model.dart';
import 'package:buildbase/view/authenticate/login/model/login_response_model.dart';

abstract class ILoginService {
  // final INetworkManager manager;
  //
  // ILoginService(this.manager);
  Future<String> getServiceData();
}
