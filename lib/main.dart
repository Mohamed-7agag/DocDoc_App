import 'package:doctors_app/core/cache/cache_helper.dart';
import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/core/utils/app_constants.dart';
import 'package:doctors_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupGetIt();
  isLoggingUser();
  await Future.wait([
    CacheHelper.init(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(const MyApp());
}

bool isLoggingUser() {
  String? token = CacheHelper.getSecuredString(AppConstants.userToken);
  if (token.isNullOrEmpty()) {
    isLogging = false;
  } else {
    isLogging = true;
  }
  return isLogging;
}
