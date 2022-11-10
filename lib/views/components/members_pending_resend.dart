// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:private_feed/views/components/labels.dart';

import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';

class MemberPendingResend extends StatelessWidget {
  const MemberPendingResend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle),
                SizedBox(
                  width: 10.5,
                ),
                Label(
                  text: 'John Apple',
                  fontSize: FontSize.p3,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Pending"),
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: AllColors.white,
                    onPrimary: AllColors.darkGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  width: 27,
                ),
                TextButton(
                  onPressed: () {},
                  child: Label(
                    text: 'Resend',
                    color: AllColors.blue,
                    underline: TextDecoration.underline,
                    fontSize: FontSize.p3,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
