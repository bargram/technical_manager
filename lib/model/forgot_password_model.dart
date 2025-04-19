
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgotPasswordModel extends GetxController{

  //TextEditingController using for text input fields
  static TextEditingController submittedCodePart1 = TextEditingController();
  static TextEditingController submittedCodePart2 = TextEditingController();
  static TextEditingController submittedCodePart3 = TextEditingController();
  static TextEditingController submittedCodePart4 = TextEditingController();
  static TextEditingController submittedCodePart5 = TextEditingController();
  static TextEditingController newPasswordController = TextEditingController();

  //using for showing phone number
  static String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(value){
    _phoneNumber = value;
  }
  //using when code sent
  static void setPhoneNumberForForgotPassword(String value){
    _phoneNumber = value;
  }


  //using for when we leave ConfirmSMSCode Page
  static void resetCodePartsAndPassword(){
    submittedCodePart1.text = '';
    submittedCodePart2.text = '';
    submittedCodePart3.text = '';
    submittedCodePart4.text = '';
    submittedCodePart5.text = '';
    newPasswordController.text = '';
  }
  //using for when we request to resend sms code
  static void resetCodeParts(){
    submittedCodePart1.text = '';
    submittedCodePart2.text = '';
    submittedCodePart3.text = '';
    submittedCodePart4.text = '';
    submittedCodePart5.text = '';
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////Life Cycle Class Managing//////////////////////////
  static bool changeNotifier = false;
  @override
  void onInit() {
    changeNotifier = true;
    super.onInit();
  }
  @override
  void onClose() {
    changeNotifier = false;
    resetCodePartsAndPassword();
    super.onClose();
  }
  //////////////////////////////////////////////////////////////////////////////

}