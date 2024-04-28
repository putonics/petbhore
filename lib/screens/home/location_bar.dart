import 'package:flutter/material.dart';
import 'package:petbhore/data/images.dart';
import 'package:petbhore/utils/helper.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Deilivering to"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: DropdownButtonHideUnderline(
            child: SizedBox(
              width: 250,
              child: DropdownButton(
                value: "Current Location",
                items: const [
                  DropdownMenuItem(
                    value: "Current Location",
                    child: Text("Current Location"),
                  ),
                ],
                icon: Image.asset(IconImage.downArrow),
                style: Helper.getTheme(context).headlineMedium,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
