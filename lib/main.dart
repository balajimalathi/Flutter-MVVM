import 'package:buildbase/core/constants/navigation/navigation_constants.dart';
import 'package:buildbase/core/init/cache/locale_manager.dart';
import 'package:buildbase/core/init/database/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/base/locator.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'core/init/responsive/size_config.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();

  //Setting up SharedPreferences
  await LocaleManager.preferencesInit();

  //DI - GETIT
  setupLocator();

  //Database initialization - DI
  Init.initialize();

  runApp(MarkApp());
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
              // locale: context.locale,
              // localizationsDelegates: context.localizationDelegates,
              // supportedLocales: context.supportedLocales,
              initialRoute: NavigationConstants.ROOT,
              onGenerateRoute: NavigationRoute.instance.generateRoute,
              theme: Provider.of<ThemeNotifier>(context).currentTheme,
              navigatorKey: NavigationService.instance.navigatorKey,
              debugShowCheckedModeBanner: true,
            );
          });
        }));
  }
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
