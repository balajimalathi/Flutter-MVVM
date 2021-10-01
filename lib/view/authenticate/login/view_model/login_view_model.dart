import 'package:buildbase/core/base/model/base_model.dart';
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/view/authenticate/login/service/login_service.dart';
import 'package:flutter/material.dart';


class LoginViewModel extends BaseModel with BaseViewModel {

  void setContext(BuildContext context) => this.context = context;
  late LoginService loginService;
  void init() {

    //Service Initialization
    loginService = LoginService();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  String d_ta = '';

  String get data => d_ta;

  Future getData() async {
    setState(ViewState.Busy);
    await loginService.getServiceData().then((value) => d_ta = value);
    setState(ViewState.Idle);
  }

}
