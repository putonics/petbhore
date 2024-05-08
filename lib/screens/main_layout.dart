import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: DataGradientColors.red)),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
    );
  }
}
