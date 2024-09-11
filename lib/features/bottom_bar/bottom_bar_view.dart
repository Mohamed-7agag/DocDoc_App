import 'package:doctors_app/features/bottom_bar/custom_bottom_bar.dart';
import 'package:doctors_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  final List<Widget> screens = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
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
