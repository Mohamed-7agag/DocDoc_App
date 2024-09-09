import 'package:doctors_app/core/cache/cache_helper.dart';
import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupGetIt();
  await Future.wait([
    CacheHelper.init(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(const MyApp());
}
