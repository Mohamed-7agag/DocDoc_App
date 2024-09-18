// ignore_for_file: deprecated_member_use

import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/features/appointment/presentation/views/my_appointments_view.dart';
import 'package:doctors_app/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:doctors_app/features/bottom_bar/custom_bottom_bar.dart';
import 'package:doctors_app/features/bottom_bar/on_back_button_pressed_fun.dart';
import 'package:doctors_app/features/home/presentation/views/home_view.dart';
import 'package:doctors_app/features/messages/messages_view.dart';
import 'package:doctors_app/features/profile/presentation/logic/profile_cubit/profile_cubit.dart';
import 'package:doctors_app/features/profile/presentation/views/profile_view.dart';
import 'package:doctors_app/features/search/presentation/logic/search_cubit/search_cubit.dart';
import 'package:doctors_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../appointment/presentation/logic/appointment_cubit/appointment_cubit.dart';
import '../home/presentation/logic/specialization_cubit/specialization_cubit.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  final List<Widget> screens = [
    BlocProvider(
      create: (context) =>
          SpecializationCubit(getIt())..getSpecializationList(),
      child: const HomeView(),
    ),
    const MessagesView(),
    BlocProvider(
      create: (context) => SearchCubit(getIt()),
      child: const SearchView(),
    ),
    BlocProvider(
      create: (context) => AppointmentCubit(getIt())..getMyAppointments(),
      child: const MyAppointmentsView(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(getIt())..getProfileData(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(getIt()),
        ),
      ],
      child: const ProfileView(),
    ),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onbackButtonPressed(context),
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(
          selectedIndex: index,
          onItemTapped: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
        body: screens[index],
      ),
    );
  }
}
