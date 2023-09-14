import 'package:buildbase/core/cache/local_manager.dart';
import 'package:buildbase/product/navigation/route_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'core/notifier/provider_list.dart';
import 'core/notifier/theme_notifier.dart';
import 'core/responsive/size_config.dart';
import 'product/navigation/router_generator.dart';
import 'core/navigation/router_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Setting up SharedPreferences
  await LocalManager.preferencesInit();

  //DI - GetIt
  setupLocator();

  //Database initialization - DI
  // Init.initialize();

  runApp(const MarkApp());
}

/*

MultiProvider
- All the base providers such as ThemeNotifier and Orientation providers will be added here

LayoutBuilder & OrientationBuilders
- These are responsible for screen sizes and orientations

SizeConfig
- To know screen size and orientation which was retrieved from LayoutBuilder and OrientationBuilder

*/

class MarkApp extends StatelessWidget {
  const MarkApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [...ApplicationProvider.instance.dependItems],
        child: LayoutBuilder(builder: (context, constraint) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraint, orientation);
            return MaterialApp(
              scrollBehavior: AppScrollBehavior(),
              // locale: context.locale,
              // localizationsDelegates: context.localizationDelegates,
              // supportedLocales: context.supportedLocales,
              initialRoute: RouterConstant.root,
              onGenerateRoute: RouterGenerator.instance.generateRoute,
              theme: Provider.of<ThemeNotifier>(context).currentTheme,
              navigatorKey: RouterService.instance.navigatorKey,
              debugShowCheckedModeBanner: true,
            );
          });
        }));
  }
}


class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

// Certificate pinning
// //TODO: Change the Url Before Release
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           ((X509Certificate cert, String host, int port) {
//         final isValidHost =
//             ["192.168.10.4"].contains(host); // <-- allow only hosts in array
//         return isValidHost;
//       });
//   }
// }
