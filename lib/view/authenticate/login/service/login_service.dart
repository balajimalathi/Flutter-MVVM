import 'package:buildbase/core/base/locator.dart';
import 'package:buildbase/core/init/network/network_manager.dart';
import 'package:buildbase/view/authenticate/login/model/login_model.dart';
import 'package:buildbase/view/authenticate/login/model/login_response_model.dart';

import 'ILoginService.dart';

class LoginService extends ILoginService {

  final NetworkManager _api = locator<NetworkManager>();

  @override
  Future<String> getServiceData() {

    return Future.delayed(Duration(seconds: 5), () => "data");
  }
}
