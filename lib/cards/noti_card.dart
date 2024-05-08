import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';

class NotiCard extends StatelessWidget {
  final String time;
  final String title;
  final Color color;
  const NotiCard({
    Key? key,
    required this.time,
    required this.title,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: const Border(
          bottom: BorderSide(
            color: DataColors.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: DataColors.themeColor,
            radius: 5,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: DataColors.primary,
                ),
              ),
              Text(time),
            ],
          )
        ],
      ),
    );
  }
}
