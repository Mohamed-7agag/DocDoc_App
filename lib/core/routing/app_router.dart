import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/features/auth/presentation/views/login_view.dart';
import 'package:doctors_app/features/auth/presentation/views/register_view.dart';
import 'package:doctors_app/features/onborading/views/onboarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginViewRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerViewRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      default:
        return null;
    }
  }
}
