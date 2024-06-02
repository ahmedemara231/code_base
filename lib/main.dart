import 'package:code_base/view_model/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'model/local/flutter_secure_storage.dart';
import 'model/local/shared_prefs.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.getInstance().cacheInit();
  SecureStorage.getInstance().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}