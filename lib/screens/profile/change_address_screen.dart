import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';

class ChangeAddressScreen extends StatelessWidget {
  static const routeName = "/changeAddressScreen";

  const ChangeAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                    Text(
                      "Change Address",
                      style: Helper.getTheme(context).headlineSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: Helper.getScreenHeight(context) * 0.6,
                      child: Image.asset(
                        Helper.getAssetName(
                          "map.png",
                          "real",
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const Positioned(
                      bottom: 30,
                      right: 40,
                      child: Icon(Icons.location_pin),
                    ),
                    const Positioned(
                      top: 70,
                      right: 180,
                      child: Icon(Icons.location_pin),
                    ),
                    Positioned(
                      top: 170,
                      left: 30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        width: Helper.getScreenWidth(context) * 0.45,
                        decoration: const ShapeDecoration(
                          color: DataColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              "Your Current Location",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "653 Nostrand Ave., Brooklyn, NY 11216",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      right: 205,
                      child: ClipPath(
                        clipper: CustomTriangleClipper(),
                        child: Container(
                          width: 30,
                          height: 30,
                          color: DataColors.themeColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: ShapeDecoration(
                          shape: const CircleBorder(),
                          color: DataColors.themeColor.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.star_rounded,
                          color: DataColors.themeColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "Choose a saved place",
                          style: TextStyle(
                            color: DataColors.primary,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                )
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
