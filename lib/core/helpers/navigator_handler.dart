import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/utils/widgets/custom_cherry_toast.dart';
import 'package:flutter/material.dart';

class NavigationHandler {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void goToLoginView() {
    warningCherryToast(
      navigatorKey.currentState!.context,
      'Session Expired',
      'Please login again',
    );
    navigatorKey.currentState?.pushReplacementNamed(Routes.loginViewRoute);
  }
}
