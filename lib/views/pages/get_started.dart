// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:private_feed/backend/user_data.dart';
import 'package:private_feed/utils/all_colors.dart';
import 'package:private_feed/utils/font_size.dart';
import 'package:private_feed/utils/helper.dart';
import 'package:private_feed/views/components/buttons.dart';
import 'package:private_feed/views/components/textfields.dart';
import 'package:private_feed/views/pages/enter_code.dart';
import 'package:private_feed/views/pages/login_page.dart';

import '../components/labels.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}



class _GetStartedState extends State<GetStarted> {
  //Email_validation_page_state_method
  final _formkey = GlobalKey<FormState>();
String _email="", _password="";

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
                  SizedBox(
                    width: 200,
                    child: Label(
                      text: "Enter your Email and Password to Signup",
                      fontSize: FontSize.p1,
                      align: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      _formkey.currentState!.validate();
                      _email=value.toString().trim().toLowerCase();
                      setState(() {});
                    },
                    labelText: 'Email',
                    validator: (value) {
                      if (value.toString().isEmpty) {

                        return 'Email is required';
                      } else if (!Helper()
                          .isEmailFormatted(email: value.toString())) {

                        return 'Please insert a valid email';
                      } else {

                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    isPassword: true,
                    onChanged: (value) {
                      _password=value.toString();
                      _formkey.currentState!.validate();
                      setState(() {});
                    },
                    labelText: 'Password',
                    validator: (value) {

                      if (value.toString().isEmpty) {

                        return 'Password is required';
                      } else if (value.toString().length<8){
                        return 'Password must be atleast 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FillButton(
                    text: 'Submit',
                    onPressed: _getCurrentState?() {
                      if(_formkey.currentState!.validate()){
                       UserData().signUp(context: context, email: _email, password: _password);
                      }
                    }:null,
                    containerColor: AllColors.blue,
                    textColor: AllColors.white,
                  ),
                  SizedBox(height: 10,),
                  FillButton(text: 'Login',onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
                  },
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

  bool get _getCurrentState {
    if( _formkey.currentState==null){
      return false;
    }
   return _formkey.currentState!.validate();
  }
}
