import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:buildbase/core/base/model/base_model.dart';
import 'package:buildbase/core/base/view/base_view.dart';
import 'package:buildbase/core/constants/enums/connectivity.dart';
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/core/init/theme/light/padding_insets.dart';
import 'package:buildbase/product/provider/bottom_provider.dart';
import 'package:buildbase/product/utils/utils.dart';
import 'package:buildbase/view/example/bottom_nav/model/user_model.dart';
import 'package:buildbase/view/example/bottom_nav/view_model/view_model.dart';
import 'package:buildbase/view/example/database/user_dao.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast/sembast.dart';
import 'package:unicons/unicons.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<BottomViewModel>(
        onModelReady: (BottomViewModel model) {
          model.setContext(context);
          model.init();
          // model.getUserDetails();
          // model.getUser();
          model.getDbUser();
        },
        builder: (context, model, child) =>
            Consumer<BottomProvider>(builder: (context, index, child) {
              List<Widget> widgets = [
                DogWidget(model: model),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.yellow,
                ),
              ];

              return Scaffold(
                body: widgets.elementAt(index.index),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: index.index,
                  backgroundColor: Color(0xFFFFFFFF),
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black38,
                  selectedFontSize: 14,
                  showUnselectedLabels: false,
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                  unselectedFontSize: 14,
                  landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                  onTap: (value) {
                    index.toggle(value);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      label: 'Groups',
                      icon: Icon(UniconsLine.users_alt),
                    ),
                    BottomNavigationBarItem(
                      label: 'Broadcasts',
                      icon: Icon(UniconsLine.rss_alt),
                    ),
                    BottomNavigationBarItem(
                      label: 'Alerts',
                      icon: Icon(UniconsLine.exclamation_circle),
                    ),
                    BottomNavigationBarItem(
                      label: 'Calendar',
                      icon: Icon(UniconsLine.calendar_alt),
                    ),
                  ],
                ),
              );
            }));
  }

  @override
  void dispose() {
    print("view disposed");

    super.dispose();
  }
}

class DogWidget extends StatefulWidget {
  const DogWidget({Key? key, required this.model}) : super(key: key);
  final BottomViewModel model;

  @override
  State<DogWidget> createState() => _DogWidgetState();
}

class _DogWidgetState extends State<DogWidget> with AfterLayoutMixin {

  @override
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // widget.model.setContext(context);
    // widget.model.init();
    // var connectionStatus = Provider.of<NetworkStatus>(context);
    // var connectionStatus = context.read<NetworkStatus>();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: PaddingInsets().lowPaddingAll,
            color: widget.model.network == NetworkStatus.Offline
                ? Colors.red
                : widget.model.network == NetworkStatus.Mobile
                    ? Colors.green
                    : Colors.green,
            child: Text(
              "data",
              style: TextStyle(color: Colors.white),
            ),
          ),
          widget.model.state == ViewState.Idle ? Text("Idle") : Text("Busy"),
          widget.model.network == NetworkStatus.Offline
              ? Text("Offline")
              : widget.model.network == NetworkStatus.Mobile
                  ? Text("Mobile")
                  : Text("WiFi"),
          ElevatedButton(
              onPressed: () => widget.model.getData(),
              child: Text("Print Database")),
          ElevatedButton(
              onPressed: () => widget.model.deleteAllData(),
              child: Text("Delete User Data All")),
          spacer(20),
          TextField(
            controller: widget.model.emailController,
          ),
          ElevatedButton(
              onPressed: () => widget.model.deleteByID(),
              child: Text("Delete by ID")),
          spacer(20),
          // ElevatedButton(
          //     onPressed: () {
          //       widget.model.network == NetworkStatus.Offline
          //           ? ScaffoldMessenger.of(context).showSnackBar(snackBar1)
          //           : ScaffoldMessenger.of(context).showSnackBar(snackBar2);
          //     },
          //     child: Text("Internet Tester")),
          ElevatedButton(
              onPressed: () => widget.model.getUserDetails(),
              child: Text("Get Data from API")),

          // ElevatedButton(
          //     onPressed: () => widget.model.getAsyncUser(),
          //     child: Text("Get Async")),

          // widget.model.state == ViewState.Busy
          //     ? CircularProgressIndicator()
          //     : Expanded(
          //         child: ListView.builder(
          //             itemCount: widget.model.user.length,
          //             itemBuilder: (context, index) {
          //               // return Container(
          //               //   color: Colors.yellow,
          //               //   height: 10,
          //               //   width: 10,
          //               // );
          //               return Text(widget.model.user[index].firstName);
          //             }),
          //       ),

          // StreamBuilder<List<RecordSnapshot>>(
          // stream: UserDao().asyncFunction(),
          // builder: (context, snapshot) {
          //   if (!snapshot.hasData) {
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   }
          //   var list = snapshot.data!;
          //   var count = list.length;
          //   return ListView.builder(
          //     itemBuilder: (_, index) {
          //       var record = list[index];
          //       return ListTile(
          //         title: Text("data"),
          //         onTap: () async {
          //           // await goToRecordHomeScreen(
          //           //     context, widget.data, record.key);
          //         },
          //       );
          //     },
          //     itemCount: count,
          //   );
          // })
        ],
      ),
    );
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

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    // widget.model.getDogs();
    // widget.model.network == NetworkStatus.Offline
    //     ? showSimpleNotification(
    //         Text("this is a message from simple notification"),
    //         background: Colors.red)
    //     : showSimpleNotification(
    //         Text("this is a message from simple notification"),
    //         background: Colors.green);
  }
}

class CatWidget extends StatefulWidget {
  const CatWidget({Key? key, required this.model}) : super(key: key);
  final BottomViewModel model;

  @override
  State<CatWidget> createState() => _CatWidgetState();
}

class _CatWidgetState extends State<CatWidget> {
  @override
  Widget build(BuildContext context) {
    widget.model.setContext(context);
    widget.model.init();
    // widget.model.getDogs();

    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.amber,
          child: Text("data"),
        ),
        widget.model.state == ViewState.Idle ? Text("Idle") : Text("Busy"),
        ElevatedButton(
            onPressed: () => widget.model.getCats(), child: Text("testing")),
      ],
    );
  }
}
