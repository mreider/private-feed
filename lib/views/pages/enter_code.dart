import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/utils/font_size.dart';
import 'package:private_feed/views/components/buttons.dart';
import 'package:private_feed/views/components/labels.dart';

class EnterCode extends StatefulWidget {
  const EnterCode({super.key});

  @override
  State<EnterCode> createState() => _GetStartState();
}

class _GetStartState extends State<EnterCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AllColors.offWhite,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 176,
                ),
                Label(
                  text: 'Enter Code',
                  fontSize: FontSize.h1,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 55,
                ),
                Pinput(
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: PinTheme(
                    textStyle: TextStyle(fontSize: FontSize.h4),
                    margin: EdgeInsets.all(5),
                    width: 50,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      shape: BoxShape.rectangle,
                      color: AllColors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FillButton(
                  text: 'Back',
                  onPressed: () {},
                  containerColor: AllColors.blue,
                  textColor: AllColors.white,
                ),
                SizedBox(
                  height: 34,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Resend code".toUpperCase()),
                ),
              ],
            ),
          ),
        ));
  }
}
