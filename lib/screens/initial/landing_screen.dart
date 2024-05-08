import 'package:flutter/material.dart';
import 'package:petbhore/data/images.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'login_screen.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "/landingScreen";

  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: sized_box_for_whitespace
        body: Container(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: Helper.getScreenHeight(context) * 0.5,
              decoration: const ShapeDecoration(
                color: DataColors.themeColor,
                shape: RoundedRectangleBorder(),
              ),
              child: Image.asset(AppImage.loginBackground, fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              height: Helper.getScreenHeight(context) * 0.5,
              child: const Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 200,
                    child: Text(
                      "পেটভরে",
                      style: TextStyle(
                          fontSize: 150,
                          fontFamily: "FN Mahin Sayeedi Unicode"),
                    ),
                  ),
                )
              ]),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImage.logo,
              width: 200,
              height: 200,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: Helper.getScreenHeight(context) * 0.3,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "অফিসে ও দোকানে, ঘরের স্বাদে",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        "Eat Well, Work Well, Delicious Bengali Cuisine, Delivered with Care",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "এবার",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "  login  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "করুন",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
