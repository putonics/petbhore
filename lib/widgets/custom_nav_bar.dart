import 'package:petbhore/screens/orders/my_order_screen.dart';
import 'package:petbhore/widgets/nav_item.dart';
import 'package:petbhore/widgets/nav_item_main.dart';
import 'package:shadow_clip/shadow_clip.dart';
import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/screens/home/home_screen.dart';
import 'package:petbhore/screens/offers/offer_screen.dart';
import 'package:petbhore/screens/profile/profile_screen.dart';
import 'package:petbhore/utils/helper.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        height: 100,
        width: Helper.getScreenWidth(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipShadow(
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.placeholder,
                    blurRadius: 2,
                  ),
                ],
                clipper: CustomNavBarClipper(),
                child: Container(
                  height: 70,
                  width: Helper.getScreenWidth(context),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NavItem(
                        icon: Icons.shopping_basket,
                        label: "Orders",
                        routeName: MyOrderScreen.routeName,
                      ),
                      NavItem(
                        icon: Icons.star_purple500,
                        label: "Offers",
                        routeName: OfferScreen.routeName,
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      NavItem(
                        icon: Icons.person_4,
                        label: "Profile",
                        routeName: ProfileScreen.routeName,
                      ),
                      NavItem(
                        icon: Icons.shopping_cart,
                        label: "Cart",
                        routeName: HomeScreen.routeName,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: NavItemMain(routeName: HomeScreen.routeName),
            )
          ],
        ),
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
      size.height,
      size.width * 0.6,
      size.height,
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
