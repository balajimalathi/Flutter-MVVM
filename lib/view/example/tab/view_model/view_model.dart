import 'package:buildbase/core/base/model/base_model.dart';
import 'package:buildbase/core/constants/enums/connectivity.dart';
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/view/example/service/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabViewModel extends BaseModel with BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  late Service _service;
  void init() {
    //Service Initialization
    _service = Service();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  String d_ta = '';

  String get data => d_ta;

  Future getDogs() async {
    setState(ViewState.Busy);
    await _service.getServiceData().then((value) => d_ta = value);
    setState(ViewState.Idle);
  }

  Future getCats() async {
    setState(ViewState.Busy);
    await _service.getServiceData().then((value) => d_ta = value);
    setState(ViewState.Idle);
  }

  void checkInternet() {
    // print(connectionStatus);
    // print(context.read<ConnectivityStatus>());
    // var con = context.read<InternetModel>().connectivityStatus;
    // con == ConnectivityStatus.Offline
    //     ? ScaffoldMessenger.of(context).showSnackBar(snackBar1)
    //     : ScaffoldMessenger.of(context).showSnackBar(snackBar2);
  }

  final snackBar2 = SnackBar(
    content: const Text('Yay! Internet access'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  final snackBar1 = SnackBar(
    content: const Text('No Internet'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}
