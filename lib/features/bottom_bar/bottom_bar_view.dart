import 'package:doctors_app/core/di/dependency_injection.dart';
import 'package:doctors_app/features/appointment/presentation/logic/appointment_cubit/appointment_cubit.dart';
import 'package:doctors_app/features/appointment/presentation/views/my_appointments_view.dart';
import 'package:doctors_app/features/bottom_bar/custom_bottom_bar.dart';
import 'package:doctors_app/features/home/presentation/logic/specialization_cubit/specialization_cubit.dart';
import 'package:doctors_app/features/home/presentation/views/home_view.dart';
import 'package:doctors_app/features/search/presentation/logic/search_cubit/search_cubit.dart';
import 'package:doctors_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    const HomeView(),
    BlocProvider(
      create: (context) => SearchCubit(getIt()),
      child: const SearchView(),
    ),
    BlocProvider(
      create: (context) => AppointmentCubit(getIt())..getMyAppointments(),
      child: const MyAppointmentsView(),
    ),
    const HomeView(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: index,
        onItemTapped: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      body: SafeArea(child: screens[index]),
    );
  }
}
