import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/screens/home/category_bar.dart';
import 'package:petbhore/screens/home/location_bar.dart';
import 'package:petbhore/screens/home/recent_items.dart';
import 'package:petbhore/screens/home/top_bar.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TopBar(),
                  SizedBox(
                    height: 20,
                  ),
                  LocationBar(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: SearchBar(
                      hintText: "Search",
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.placeholderBg),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CategoryBar(),
                  SizedBox(
                    height: 50,
                  ),
                  RecentItems(),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          Positioned(bottom: 0, left: 0, child: CustomNavBar()),
        ],
      ),
    );
  }
}
