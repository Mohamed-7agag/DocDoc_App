import 'package:doctors_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

class NavigationHandler {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void goToLoginView() {
    navigatorKey.currentState?.pushReplacementNamed(Routes.loginViewRoute);
  }
}
