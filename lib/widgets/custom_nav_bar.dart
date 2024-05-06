import 'package:shadow_clip/shadow_clip.dart';
import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/screens/home/home_screen.dart';
import 'package:petbhore/screens/menu_screen.dart';
import 'package:petbhore/screens/more_screen.dart';
import 'package:petbhore/screens/offer_screen.dart';
import 'package:petbhore/screens/profile_screen.dart';
import 'package:petbhore/utils/helper.dart';

class CustomNavBar extends StatelessWidget {
  final bool home;
  final bool menu;
  final bool offer;
  final bool profile;
  final bool more;

  const CustomNavBar(
      {super.key,
      this.home = false,
      this.menu = false,
      this.offer = false,
      this.profile = false,
      this.more = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: Helper.getScreenWidth(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipShadow(
              boxShadow: const [
                BoxShadow(
                  color: AppColor.placeholder,
                  offset: Offset(
                    0,
                    -5,
                  ),
                  blurRadius: 10,
                ),
              ],
              clipper: CustomNavBarClipper(),
              child: Container(
                height: 80,
                width: Helper.getScreenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!menu) {
                          Navigator.of(context).pushNamed(MenuScreen.routeName);
                        }
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_food_beverage,
                            color: Color.fromARGB(255, 143, 139, 140),
                            size: 24.0,
                          ),
                          Text("Orders"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!offer) {
                          Navigator.of(context)
                              .pushNamed(OfferScreen.routeName);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          offer
                              ? Image.asset(
                                  Helper.getAssetName(
                                      "bag_filled.png", "virtual"),
                                )
                              : Image.asset(
                                  Helper.getAssetName("bag.png", "virtual"),
                                ),
                          offer
                              ? const Text("Offers",
                                  style: TextStyle(color: AppColor.themeColor))
                              : const Text("Offers"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!profile) {
                          Navigator.of(context)
                              .pushNamed(ProfileScreen.routeName);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          profile
                              ? Image.asset(
                                  Helper.getAssetName(
                                      "user_filled.png", "virtual"),
                                )
                              : Image.asset(
                                  Helper.getAssetName("user.png", "virtual"),
                                ),
                          profile
                              ? const Text("Profile",
                                  style: TextStyle(color: AppColor.themeColor))
                              : const Text("Profile"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!more) {
                          Navigator.of(context).pushNamed(MoreScreen.routeName);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          more
                              ? Image.asset(
                                  Helper.getAssetName(
                                      "cart_filled.png", "virtual"),
                                )
                              : Image.asset(
                                  Helper.getAssetName("cart.png", "virtual"),
                                ),
                          more
                              ? const Text("Cart",
                                  style: TextStyle(color: AppColor.themeColor))
                              : const Text("Cart"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 70,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.food_bank,
                        size: 40,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
