// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/utils/font_size.dart';
import 'package:private_feed/utils/helper.dart';
import 'package:private_feed/views/components/buttons.dart';
import 'package:private_feed/views/components/feed_members_builder.dart';
import 'package:private_feed/views/components/textfields.dart';
import 'package:private_feed/views/pages/name_input.dart';
import '../components/appbar.dart';
import '../components/labels.dart';
import '../components/members_pending_resend.dart';

class FeedMembers extends StatefulWidget {
  const FeedMembers({super.key});

  @override
  State<FeedMembers> createState() => _GetStartedState();
}

final _emailControler = TextEditingController();

final _formkey = GlobalKey<FormState>();

class _GetStartedState extends State<FeedMembers> {
  //Email_validation_page_state_method
  bool _valid = false;

  _submit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NameInputPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        elevation: 0.0,
        title: 'My awesome feed',
        backgroundColor: AllColors.appcolor,
        foregroundColor: AllColors.black,
        actionIcon: Icons.people,
        backLeadingIcon: Icons.arrow_back_ios,
        imageLeadingIcon: Icons.image,
        onPressedBack: () {
          Navigator.pop(context);
        },
        onPressedImage: () {},
        onPressedAccount: () {},
      ),
      backgroundColor: AllColors.offWhite,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Label(
                    text: "Invite Members",
                    fontSize: FontSize.h3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Label(
                    fontSize: FontSize.p4,
                    color: AllColors.darkGrey.withOpacity(0.7),
                    text: 'Email',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: _emailControler,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: () {
                        _emailControler.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  hintText: 'member1@domain.com',
                  border: OutlineInputBorder(),
                  onChanged: (value) {
                    _formkey.currentState!.validate();
                    setState(() {});
                  },
                  validator: (value) {
                    if (!Helper().isEmailFormatted(email: value.toString())) {
                      _valid = false;
                      return 'Please insert a valid email';
                    } else {
                      _valid = true;
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {},
                  child: Label(
                    text: "Press enter to add another",
                    color: AllColors.darkGrey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FillButton(
                  text: 'send invitations',
                  onPressed: _valid == true
                      ? () {
                          _submit();
                        }
                      : null,
                  containerColor: AllColors.blue,
                  textColor: AllColors.white,
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Label(
                    text: "Feed Members",
                    fontSize: FontSize.h3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MemberPendingResend(),
                FeedMembersListSeparated(),
                Divider(),
                SizedBox(
                  height: 100,
                ),
                Divider(
                  indent: 2,
                  color: AllColors.danger,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Label(
                    text: "Danger Zone",
                    fontSize: FontSize.h3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Label(
                      text: 'Delete Feed',
                      color: AllColors.danger,
                      underline: TextDecoration.underline,
                      fontSize: FontSize.p3,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Label(
                      align: TextAlign.center,
                      text:
                          'The group and messages will be\n deleted.This is permanent. Can not be\n undone.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
