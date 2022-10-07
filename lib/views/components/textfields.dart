// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final onChanged;
  final FormFieldValidator validator;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final bool? isPassword;
  final InputBorder? border;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Color? filledColor;
  final String? hintText;
  final String? labelText;

  const CustomTextField({
    Key? key,
    this.width,
    this.onChanged,
    this.controller,
    required this.validator,
    this.textInputType,
    this.isPassword,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.filledColor,
    this.hintText,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: isPassword ?? false,
      obscuringCharacter: "*",
      keyboardType: textInputType,
      controller: controller,
      cursorColor: AllColors.black,
      style: const TextStyle(
        fontSize: FontSize.p2,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: FontSize.p2,
            fontWeight: FontWeight.w500,
            color: AllColors.black.withOpacity(0.5)),
        contentPadding: const EdgeInsets.only(
          bottom: 10,
          left: 10,
        ),
        counterStyle: TextStyle(fontSize: FontSize.p5),
        errorStyle: TextStyle(fontSize: FontSize.p5),
        border: border,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: filledColor != null,
        fillColor: filledColor ?? AllColors.white,
      ),
      validator: validator,
    );
  }
}
