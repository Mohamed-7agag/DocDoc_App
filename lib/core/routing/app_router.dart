import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:doctors_app/features/auth/presentation/views/login_view.dart';
import 'package:doctors_app/features/auth/presentation/views/register_view.dart';
import 'package:doctors_app/features/bottom_bar/bottom_bar_view.dart';
import 'package:doctors_app/features/home/presentation/logic/specialization_cubit/specialization_cubit.dart';
import 'package:doctors_app/features/home/presentation/views/home_view.dart';
import 'package:doctors_app/features/onborading/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //! Onboarding Route
      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      //! Login Route
      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(getIt()),
            child: const LoginView(),
          ),
        );
      //! Register Route
      case Routes.registerViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(getIt()),
            child: const RegisterView(),
          ),
        );
      //! bottom bar Route
      case Routes.bottomBarViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SpecializationCubit(getIt())..getSpecializationList(),
            child: const BottomBarView(),
          ),
        );
      //! Home Route
      case Routes.homeViewRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return null;
    }
  }
}
