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
                color: AppColor.themeColor,
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
                    height: 130,
                    child: Column(
                      children: [
                        Text(
                          "পেটভরে",
                          style: TextStyle(fontSize: 60),
                        ),
                        Text(
                          "Home Delivery",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
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
                  const Flexible(
                    child: Text(
                      "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(AppColor.themeColor),
                        shape: MaterialStateProperty.all(
                          const StadiumBorder(
                            side: BorderSide(
                                color: AppColor.themeColor, width: 1.5),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Create an Account"),
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
