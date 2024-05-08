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
    this.onSubmitted,
    this.maxLength,
    this.enabled = true,
  });

  final String hintText;
  final EdgeInsets padding;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final int? maxLength;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: DataColors.placeholderBg,
        shape: StadiumBorder(),
      ),
      child: TextField(
        enabled: enabled,
        maxLength: maxLength,
        canRequestFocus: true,
        focusNode: focusNode,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: DataColors.placeholder,
          ),
          contentPadding: padding,
        ),
      ),
    );
  }
}
