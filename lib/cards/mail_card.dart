import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';

class MailCard extends StatelessWidget {
  final String time;
  final String title;
  final String description;
  final Color color;
  const MailCard({
    Key? key,
    required this.time,
    required this.title,
    required this.description,
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
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 5,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(description),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
              Image.asset(Helper.getAssetName("star.png", "virtual"))
            ],
          ),
        ],
      ),
    );
  }
}
