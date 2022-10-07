// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:private_feed/utils/font_size.dart';
import 'package:private_feed/views/components/buttons.dart';
import 'package:private_feed/views/components/labels.dart';

import '../../utils/all_colors.dart';

class NoInvitation extends StatefulWidget {
  const NoInvitation({super.key});

  @override
  State<NoInvitation> createState() => _GetStartState();
}

class _GetStartState extends State<NoInvitation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Label(
              text: 'Email not found',
              fontSize: FontSize.h1,
              fontWeight: FontWeight.w600,
              align: TextAlign.center,
            ),
            SizedBox(
              height: 35,
            ),
            Label(
              text: 'Membership is currently limited\n to friends and family.',
              fontSize: FontSize.p1,
              align: TextAlign.center,
            ),
            SizedBox(
              height: 51,
            ),
            FillButton(
              text: 'Back',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoInvitation()));
              },
              containerColor: AllColors.blue,
              textColor: AllColors.white,
            ),
          ],
        ),
      ),
    ));
  }
}
