import 'package:flutter/material.dart';

enum BarColor {
  red,
  orange,
  blue,
  purple,
  green,
  black,
}

class MessageBar extends StatelessWidget {
  static List<Color> getBgColor(BarColor color) {
    switch (color) {
      case BarColor.red:
        return [
          Colors.pinkAccent,
          Colors.redAccent,
          Colors.orangeAccent,
        ];
      case BarColor.orange:
        return [
          Colors.deepOrange,
          Colors.amber,
          Colors.yellow,
        ];
      case BarColor.blue:
        return [
          Colors.blueAccent,
          Colors.lightBlueAccent,
          Colors.cyanAccent,
        ];
      case BarColor.purple:
        return [
          Colors.purple,
          Colors.deepPurple,
          Colors.indigoAccent,
        ];
      case BarColor.green:
        return [
          Colors.teal,
          Colors.green,
          Colors.lightGreenAccent,
        ];
      default:
        return [
          Colors.black,
          Colors.grey,
        ];
    }
  }

  const MessageBar({
    super.key,
    required this.message,
    this.color = BarColor.black,
    this.textColor = Colors.white,
    this.margin,
  });

  final BarColor color;
  final String message;
  final Color textColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return message.isEmpty
        ? const SizedBox()
        : Container(
            margin: margin,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: getBgColor(color))),
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
