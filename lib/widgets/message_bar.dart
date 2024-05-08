import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';

class MessageBar extends StatelessWidget {
  const MessageBar({
    super.key,
    required this.message,
    this.colors = DataGradientColors.black,
    this.textColor = Colors.white,
    this.margin,
  });

  final List<Color> colors;
  final String message;
  final Color textColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return message.isEmpty
        ? const SizedBox()
        : Container(
            margin: margin,
            decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              child: Text(
                message,
                style: TextStyle(color: textColor),
              ),
            ),
          );
  }
}
