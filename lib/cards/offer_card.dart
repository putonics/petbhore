import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';

class OfferCard extends StatelessWidget {
  final String name;
  final Image image;
  const OfferCard({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: image),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  name,
                  style: Helper.getTheme(context)
                      .headlineMedium
                      ?.copyWith(color: AppColor.primary),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Icon(Icons.star),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "4.9",
                  style: TextStyle(
                    color: AppColor.themeColor,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("(124 ratings) Cafe"),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    ".",
                    style: TextStyle(
                        color: AppColor.themeColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(" Western Food"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
