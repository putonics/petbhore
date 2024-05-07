import 'package:flutter/material.dart';
import 'package:petbhore/cards/menu_card.dart';

import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';
import 'package:petbhore/widgets/search_barx.dart';

import 'dessert_screen.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";

  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Menu",
                        style: Helper.getTheme(context).headlineSmall,
                      ),
                      Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SearchBarx(title: "Search Food"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.6,
                    width: Helper.getScreenWidth(context),
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              color: AppColor.themeColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MenuCard(
                                imageShape: ClipOval(
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      Helper.getAssetName(
                                          "western2.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Food",
                                count: "120",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      Helper.getAssetName(
                                          "coffee2.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Beverage",
                                count: "220",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(DessertScreen.routeName);
                                },
                                child: MenuCard(
                                  imageShape: ClipPath(
                                    clipper: CustomTriangle(),
                                    child: SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Image.asset(
                                        Helper.getAssetName(
                                            "dessert.jpg", "real"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  name: "Desserts",
                                  count: "135",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MenuCard(
                                imageShape: ClipPath(
                                  clipper: CustomDiamond(),
                                  child: SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Image.asset(
                                      Helper.getAssetName(
                                          "hamburger3.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Promotions",
                                count: "25",
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          )
        ],
      ),
    );
  }
}
