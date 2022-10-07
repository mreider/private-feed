import 'package:flutter/cupertino.dart';

import '../../utils/all_colors.dart';

class Label extends StatelessWidget {
  final String text;
  final double? fontSize;

  final FontWeight? fontWeight;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextAlign? align;
  final Color? color;
  final TextDecoration? underline;

  const Label({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.align,
    this.color,
    this.maxLine,
    this.overflow,
    this.underline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: const TextStyle(),
        child: Text(text,
            maxLines: maxLine ?? 50,
            overflow: overflow ?? TextOverflow.visible,
            textAlign: align ?? TextAlign.left,
            style: TextStyle(
                decoration: underline ?? TextDecoration.none,
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: color ?? AllColors.black)));
  }
}
