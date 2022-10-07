// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:private_feed/utils/all_colors.dart';

class ImageViewer extends StatelessWidget {
  final VoidCallback onSelecImage;
  final File? imageFile;

  ImageViewer({Key? key, required File? image, required this.onSelecImage})
      : imageFile = image,
        super(key: key);

  String _profilePlaceholder = "assets/images/profile_placeholder.svg";
  Size _placeholderSize = Size(120, 120);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: imageFile == null
            ? Center(
                child: Container(
                    height: _placeholderSize.height + 100,
                    width: _placeholderSize.width + 100,
                    decoration: BoxDecoration(
                        color: AllColors.grey,
                        borderRadius: BorderRadius.circular(200)),
                    child: Center(
                        child: SvgPicture.asset(
                      _profilePlaceholder,
                      height: _placeholderSize.height,
                      width: _placeholderSize.width,
                      color: AllColors.darkGrey,
                    ))))
            : Center(
                child: ClipOval(
                  child: Image.file(
                    imageFile!,
                    height: _placeholderSize.height + 100,
                    width: _placeholderSize.width + 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        onPressed: onSelecImage);
  }
}
