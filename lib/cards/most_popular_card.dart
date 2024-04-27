import 'package:flutter/material.dart';
import 'package:petbhore/const/colors.dart';
import 'package:petbhore/utils/helper.dart';

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 300,
            height: 200,
            child: image,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: Helper.getTheme(context)
              .headlineMedium
              ?.copyWith(color: AppColor.primary),
        ),
        Row(
          children: [
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
            const SizedBox(
              width: 20,
            ),
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
            )
          ],
        )
      ],
    );
  }
}
