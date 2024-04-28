import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';

class SearchBarx extends StatelessWidget {
  final String title;
  const SearchBarx({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColor.placeholderBg,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Image.asset(
              Helper.getAssetName("search_filled.png", "virtual"),
            ),
            hintText: title,
            hintStyle: const TextStyle(
              color: AppColor.placeholder,
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.only(
              top: 17,
            ),
          ),
        ),
      ),
    );
  }
}
