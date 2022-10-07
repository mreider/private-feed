// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';
import '../components/buttons.dart';
import '../components/labels.dart';

class Sent extends StatefulWidget {
  const Sent({super.key});

  @override
  State<Sent> createState() => _SentState();
}

class _SentState extends State<Sent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 312,
            ),
            Center(
              child: Label(
                text: "Invitation(s) sent!",
                fontSize: FontSize.h3,
                fontWeight: FontWeight.w500,
                align: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 47,
            ),
            Center(
              child: FillButton(
                width: 164,
                height: 44,
                text: 'Continue',
                fontSize: FontSize.p3,
                fontWeight: FontWeight.w500,
                onPressed: () {},
                containerColor: AllColors.blue,
                textColor: AllColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
