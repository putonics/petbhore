import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petbhore/data/images.dart';
import 'package:petbhore/utils/helper.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Good morning Akila!",
            style: Helper.getTheme(context).headlineSmall,
          ),
          GestureDetector(
            child: Image.asset(IconImage.cart),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
    );
  }
}

// greeting(String name, bool )

const timeGreetings = ["Good morning", "Good Afternoon", "Good Evening"];
const catchyGreetings = [
  "Welcome!",
  "What delicious lunch are you craving today?"
];
