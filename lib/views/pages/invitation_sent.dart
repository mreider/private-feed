// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:private_feed/views/pages/new_message.dart';

import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';
import '../components/buttons.dart';
import '../components/labels.dart';

class InviationSent extends StatefulWidget {
  const InviationSent({super.key});

  @override
  State<InviationSent> createState() => _InviationSentState();
}

class _InviationSentState extends State<InviationSent> {
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewMessage()));
                },
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
