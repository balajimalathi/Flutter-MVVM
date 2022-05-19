import 'package:buildbase/core/base/model/base_model.dart';
import 'package:buildbase/core/constants/enums/connectivity.dart';
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/view/example/bottom_nav/model/user_model.dart';
import 'package:buildbase/view/example/database/user_dao.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:buildbase/view/example/service/service.dart';
import 'package:provider/provider.dart';

class BottomViewModel extends BaseModel with BaseViewModel, UserDao {
  void setContext(BuildContext context) => this.context = context;
  late Service _service;
  UserDao _userDao = UserDao();
  //Selected index
  int _bottom_index = 0;
  // NetworkStatus connectionStatus = NetworkStatus.Offline;
  int get index => _bottom_index;

  void init() {
    //Service Initialization
    _service = Service();

    // connectionStatus = Provider.of<NetworkStatus>(context);

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("view model disposed");
    super.dispose();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  String d_ta = '';

  String get data => d_ta;

  String exception = '';
  String get exp => exception;

  List<Datum> userModel = [];
  List<Datum> get user => userModel;

  void navigationIndex(index) => _bottom_index = index;

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

  void getData() {
    _userDao.getAllSortedByName().then((value) {
      for (Datum datum in value) {
        print(datum.firstName);
      }
      userModel = value;
      notifyListeners();
    });
  }

  void deleteAllData() {
    _userDao.deleteAll();
  }

  void deleteByID() {
    int id = int.parse(emailController.text);
    _userDao.delete(id);
    getData();
  }

  final snackBar2 = const SnackBar(content: const Text('Yay! Internet access'));

  final snackBar1 = const SnackBar(content: const Text('No Internet'));

  Future getUserDetails() async {
    setState(ViewState.Busy);
    await _service.getAllUsers().then((value) {
      value.fold((l) => exception = l, (r) => userModel = r);
    });
    setState(ViewState.Idle);
  }

  Future getDbUser() async {
    await _userDao.getAllSortedByName().then((value) => userModel = value);
    notifyListeners();
  }

  Future getUser() async {
    setState(ViewState.Busy);
    await _service.getAll().then((value) => userModel = value);
    setState(ViewState.Idle);
  }

  void getAsyncUser() {
    asyncFunction();
  }
}
