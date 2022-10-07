import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/all_colors.dart';

import '../../utils/font_size.dart';
import 'labels.dart';

class FillButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? containerColor, textColor;
  final double? height, fontSize;
  final FontWeight? fontWeight;
  final double? width;

  const FillButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.containerColor,
      this.textColor,
      this.height,
      this.fontWeight,
      this.fontSize,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null ? 0.3 : 1,
      child: CupertinoButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
                  Border.all(color: containerColor ?? AllColors.blue, width: 1),
              color: (containerColor ?? AllColors.white)),
          height: height ?? 45,
          child: Label(
            text: text.toUpperCase(),
            color: textColor ?? AllColors.black,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize ?? FontSize.p1,
          ),
        ),
      ),
    );
  }
}
