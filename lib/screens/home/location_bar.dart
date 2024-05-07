import 'package:flutter/material.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_pin,
          color: Colors.blueGrey,
        ),
        const SizedBox(width: 10),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: "Purba Bardhaman",
            items: const [
              DropdownMenuItem(
                value: "Purba Bardhaman",
                child: Text("Purba Bardhaman"),
              ),
              DropdownMenuItem(
                value: "Durgapur",
                child: Text("Durgapur"),
              ),
            ],
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey),
            style: const TextStyle(fontSize: 15.0, color: Colors.blueGrey),
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}
