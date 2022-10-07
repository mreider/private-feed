import 'package:flutter/material.dart';

class feedlikeWidget extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final double? size;

  const feedlikeWidget({
    Key? key,
    this.icon,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}

class feedcommentWidget extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final double? size;

  const feedcommentWidget({
    Key? key,
    this.icon,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
