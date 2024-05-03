import 'package:flutter/material.dart';
import '../data/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required this.hintText,
    this.padding = const EdgeInsets.only(left: 40),
    this.keyboardType,
    this.focusNode,
    this.onChanged,
    this.maxLength,
  });

  final String hintText;
  final EdgeInsets padding;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String text)? onChanged;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: StadiumBorder(),
      ),
      child: TextField(
        maxLength: maxLength,
        canRequestFocus: true,
        focusNode: focusNode,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.placeholder,
          ),
          contentPadding: padding,
        ),
      ),
    );
  }
}
