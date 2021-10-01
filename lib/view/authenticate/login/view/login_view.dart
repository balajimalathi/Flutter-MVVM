import 'package:buildbase/core/base/view/base_view.dart';
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/core/extensions/context_extension.dart';
import 'package:buildbase/core/extensions/string_extension.dart';
import 'package:buildbase/view/authenticate/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (LoginViewModel model) {
        model.setContext(context);
        model.init();
      },
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          key: model.scaffoldState,
          appBar: AppBar(title: Text("Title"),),
          body: SafeArea(
            child: Column(
              children: [
                Text("data"),
                model.state == ViewState.Idle ? Text("Idle") : Text("Busy"),
                ElevatedButton(onPressed: ()=> model.getData(), child: Text("testing")),
                FloatingActionButton(onPressed: ()=> model.getData())
                // buildAnimatedContainer(context),
                // buildTabBarContainer(context, viewModel),
                // Observer(builder: (_) {
                //   return Visibility(
                //     child: buildExpandedLoginForm(context, viewModel),
                //     visible: viewModel.currentTabIndex == 0,
                //   );
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
