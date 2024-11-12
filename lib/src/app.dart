import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/data_source/local/shared.dart';
import 'core/helpers/data_types/permession_process_model.dart';
import 'core/helpers/helper_methods/handle_permissions.dart';
import 'core/shared/observers/route_observer.dart';
import 'features/home/presentation/screens/main_screen.dart';
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    AppPermission().check(
      PermissionProcessModel(
        permissionClient: PermissionClient.notification,
        onPermissionGranted: () {},
        onPermissionDenied: () {},
      ),
    );
    super.initState();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
      return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        // shortcuts: ,
        // actions: ,
        locale: context.locale, // context.setLocal
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        title: 'App Name'.tr(), // give the translation of App Name for example
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        navigatorObservers: [AppNavigationObserver()],
        theme: CacheHelper.getInstance().shared.getBool('appTheme') == false
            ? ThemeData.light()
            : ThemeData.dark(),
        home: const Home(),
        builder: EasyLoading.init(),
      ),
    );
  }
}