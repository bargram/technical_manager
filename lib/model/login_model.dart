



import 'package:flutter/material.dart';

class LoginModel {

  static TextEditingController mobileNumberController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static reset(){
    mobileNumberController.text = '';
    passwordController.text = '';
  }
}