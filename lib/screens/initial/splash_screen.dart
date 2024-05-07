import 'package:flutter/material.dart';
import 'package:petbhore/data/images.dart';
import 'package:petbhore/utils/helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                AppImage.splashBackground,
                fit: BoxFit.fill,
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
          ],
        ),
      ),
    );
  }
}
