import 'package:buildbase/core/base/model/base_model.dart';
import 'package:buildbase/core/constants/enums/connectivity.dart';
import 'package:buildbase/product/provider/bottom_provider.dart';
import 'package:buildbase/product/provider/orient_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    ChangeNotifierProvider<BottomProvider>(
      create: (_) => BottomProvider(),
    ),
    ChangeNotifierProvider<OrientationProvider>(
      create: (_) => OrientationProvider(),
    ),
    // ChangeNotifierProvider<InternetModel>(
    //   create: (_) => InternetModel(),
    // ),
    // StreamProvider<ConnectivityStatus>(
    //     create:(_)=> ConnectivityService().connectionStatusController.stream,
    //     initialData: ConnectivityStatus.Offline),
  ];

  List<SingleChildWidget> uiChangesItems = [];
}
