// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:private_feed/views/pages/pick_profile_image.dart';

import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';

import '../components/labels.dart';
import '../components/textfields.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({super.key});

  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.offWhite,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 63,
              ),
              Label(
                text: 'What shall we call you?',
                fontSize: FontSize.h1,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 60,
              ),
              CustomTextField(
                labelText: 'John Mike',
                validator: (value) {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PickProfileImage()));
        },
      ),
    );
  }
}
