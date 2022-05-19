import 'package:after_layout/after_layout.dart';
import 'package:buildbase/core/base/view/base_view.dart';
import 'package:buildbase/core/constants/enums/connectivity.dart';
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/product/utils/utils.dart';
import 'package:buildbase/view/example/tab/view_model/view_model.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TabViewModel>(
      onModelReady: (TabViewModel model) {
        model.setContext(context);
        model.init();
      },
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          key: model.scaffoldState,
          appBar: AppBar(
            title: Text('Fixed Tabs'),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                    text: 'DOGS',
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
                Tab(text: 'CATS', icon: Icon(Icons.music_note)),
              ],
            ),
          ),
          body: Column(
            children: [
              Visibility(
                visible: model.network == NetworkStatus.Offline,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  height: 48,
                  width: double.infinity,
                  color: model.network == NetworkStatus.Offline
                      ? Colors.red
                      : Colors.green,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    DogWidget(
                      model: model,
                    ),
                    CatWidget(
                      model: model,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DogWidget extends StatefulWidget {
  const DogWidget({Key? key, required this.model}) : super(key: key);
  final TabViewModel model;
  @override
  State<DogWidget> createState() => _DogWidgetState();
}

class _DogWidgetState extends State<DogWidget> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    // widget.model.setContext(context);
    // widget.model.init();

    return Column(
      children: [
        spacer(10),
        Text(
          "Model State",
          style: TextStyle(fontSize: 24),
        ),
        spacer(10),
        widget.model.state == ViewState.Idle
            ? Text(
                "Idle",
                style: TextStyle(fontSize: 16),
              )
            : Text(
                "Busy",
                style: TextStyle(fontSize: 16),
              ),
        ElevatedButton(
            onPressed: () => widget.model.getCats(),
            child: Text("Hit Viewmodel")),
        Text("Future will be hit back after 5 seconds"),
        spacer(20),
        ElevatedButton(
            onPressed: () => widget.model.checkInternet(),
            child: Text("Check internet connectivity")),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    widget.model.getDogs();
  }
}

class CatWidget extends StatefulWidget {
  const CatWidget({Key? key, required this.model}) : super(key: key);
  final TabViewModel model;

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
        spacer(10),
        Text(
          "Model State",
          style: TextStyle(fontSize: 24),
        ),
        spacer(10),
        widget.model.state == ViewState.Idle
            ? Text(
                "Idle",
                style: TextStyle(fontSize: 16),
              )
            : Text(
                "Busy",
                style: TextStyle(fontSize: 16),
              ),
        ElevatedButton(
            onPressed: () => widget.model.getCats(),
            child: Text("Hit Viewmodel")),
        Text("Future will be hit back after 5 seconds"),
        spacer(20),
        ElevatedButton(
            onPressed: () => widget.model.checkInternet(),
            child: Text("Check internet connectivity")),
      ],
    );
  }
}
