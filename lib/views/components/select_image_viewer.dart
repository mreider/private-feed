// ignore_for_file: sort_child_properties_last, prefer_final_fields

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/all_colors.dart';

class SelectImageViewer extends StatelessWidget {
  final VoidCallback onSelectImage;
  final File? imageFile;
  final double? height, width;
  final BorderRadius? borderRadius;
  final Widget? center;

  SelectImageViewer({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
    this.center,
    required File? image,
    required this.onSelectImage,
  })  : imageFile = image,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.all(0),
        child: imageFile == null
        ? Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AllColors.grey,
          borderRadius: borderRadius,
        ),
        child: center,
      ),
    )
        : Center(
      child: Image.file(
        imageFile!,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    ), onPressed: onSelectImage);
  }
}
