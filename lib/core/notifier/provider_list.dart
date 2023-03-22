import 'package:buildbase/product/provider/bottom_provider.dart';
import 'package:buildbase/product/provider/orient_provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../view/menu_controller.dart';
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
    ChangeNotifierProvider<MenuAppController>(
      create: (context) => MenuAppController(),
    ),
    StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker().onStatusChange;
        })
  ];

  List<SingleChildWidget> uiChangesItems = [];
}
