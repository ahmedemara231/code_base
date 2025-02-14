import 'package:code_base/src/app.dart';
import 'package:code_base/src/core/constants/app_constants.dart';
import 'package:code_base/src/core/data_source/local/secure.dart';
import 'package:code_base/src/core/data_source/local/shared.dart';
import 'package:code_base/src/core/helpers/base_widgets/error/unexpected_error_handler.dart';
import 'package:code_base/src/core/shared/observers/bloc_observer.dart';
import 'package:code_base/src/core/shared/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().setUpBlocs();
  Bloc.observer = MyBlocObserver();
  SecureStorage.getInstance().init();
  Constants.configLoading();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
    CacheHelper.getInstance().cacheInit(),
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  ]);

  // Flutter errors
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    FlutterError.dumpErrorToConsole(errorDetails);
    runApp(UnexpectedErrorHandler(errorDetails: errorDetails));
  };

  // asynchronous errors
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // if (kReleaseMode) {
  //   ErrorWidget.builder =
  //       (FlutterErrorDetails details) => const ExceptionView();
  // }
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'SA')
        ],
        path: 'assets/translation',
        fallbackLocale: const Locale('en', 'US'),
        child: const App()
    ),
  );
}