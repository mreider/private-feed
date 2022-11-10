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
  final _formkey = GlobalKey<FormState>();
  bool _valid = false;
  _submit() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PickProfileImage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.offWhite,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formkey,
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
                  onChanged: (value) {
                    _formkey.currentState!.validate();
                    setState(() {});
                  },
                  labelText: 'John Mike',
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      _valid = false;
                      return 'Name is required';
                    } else {
                      _valid = true;
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: _valid == true
            ? () {
                _submit();
              }
            : null,
      ),
    );
  }
}
