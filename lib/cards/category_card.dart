import 'package:flutter/material.dart';
import 'package:petbhore/const/colors.dart';
import 'package:petbhore/utils/helper.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.name,
  });

  final String name;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 100,
            height: 100,
            child: image,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: Helper.getTheme(context)
              .headlineMedium
              ?.copyWith(color: AppColor.primary, fontSize: 16),
        ),
      ],
    );
  }
}
