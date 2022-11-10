// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/utils/font_size.dart';
import 'package:private_feed/utils/helper.dart';
import 'package:private_feed/views/components/buttons.dart';
import 'package:private_feed/views/components/textfields.dart';
import 'package:private_feed/views/pages/enter_code.dart';

import '../components/labels.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

//  _formkey.currentState!.validate()
//Email_validation_prefer_code
final _formkey = GlobalKey<FormState>();
// final _emailValidator = MultiValidator([
//   RequiredValidator(errorText: "required*"),
//   EmailValidator(errorText: "enter valid email"),
// ]);

class _GetStartedState extends State<GetStarted> {
  //Email_validation_page_state_method
  bool _valid = false;
  _submit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterCode()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AllColors.offWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 114,
                  ),
                  Label(
                    text: "Get Started!",
                    fontSize: FontSize.h1,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.center,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Label(
                    text: "Enter your Email\nWe will send you a code",
                    fontSize: FontSize.p1,
                    align: TextAlign.center,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      _formkey.currentState!.validate();
                      setState(() {});
                    },
                    labelText: 'Email',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        _valid = false;
                        return 'Email is required';
                      } else if (!Helper()
                          .isEmailFormatted(email: value.toString())) {
                        _valid = false;
                        return 'Please insert a valid email';
                      } else {
                        _valid = true;
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FillButton(
                    text: 'Submit',
                    onPressed: _valid == true
                        ? () {
                            _submit();
                          }
                        : null,
                    containerColor: AllColors.blue,
                    textColor: AllColors.white,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
