import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/screens/home/category_bar.dart';
import 'package:petbhore/screens/home/location_bar.dart';
import 'package:petbhore/screens/home/recent_items.dart';
import 'package:petbhore/screens/main_layout.dart';
import 'package:petbhore/widgets/message_bar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageBar(
            message: "Welcome!",
            colors: DataGradientColors.red,
            margin: EdgeInsets.only(bottom: 10),
          ),
          LocationBar(),
          SizedBox(
            height: 10,
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
    );
  }
}
