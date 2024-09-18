import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:doctors_app/core/helpers/navigator_handler.dart';
import 'package:doctors_app/core/routing/app_router.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/utils/app_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: NavigationHandler.navigatorKey,
          theme: ThemeData.light().copyWith(
            textTheme: GoogleFonts.interTextTheme(
              ThemeData.light().textTheme,
            ),
            scaffoldBackgroundColor: AppColors.white,
          ),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute:
              AppConstants.isLogging ? Routes.bottomBarViewRoute : Routes.onBoardingViewRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
