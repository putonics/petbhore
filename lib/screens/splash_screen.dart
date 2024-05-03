import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petbhore/data/images.dart';
import 'package:petbhore/utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.nextScreenRouteName});

  final String nextScreenRouteName;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(widget.nextScreenRouteName);
    });

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
