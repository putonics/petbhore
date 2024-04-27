import 'package:flutter/material.dart';
import 'package:petbhore/const/colors.dart';
import 'package:petbhore/utils/helper.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: image),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: Helper.getTheme(context).displaySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.orange,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("(124 ratings)"),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Cafe"),
                    const SizedBox(
                      width: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Western Food"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
