import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dto/timer_initializer.dart';




class ConfirmLoginSMSCodeModel extends GetxController{

  //TextEditingController using for text input fields
  static TextEditingController submittedCodePart1 = TextEditingController();
  static TextEditingController submittedCodePart2 = TextEditingController();
  static TextEditingController submittedCodePart3 = TextEditingController();
  static TextEditingController submittedCodePart4 = TextEditingController();
  static TextEditingController submittedCodePart5 = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  //using for showing phone number
  static String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(value){
    _phoneNumber = value;
  }
  //using when code sent
  static void setPhoneNumberForConfirmSMSCode(String value){
    _phoneNumber = value;
  }

  // using for detecting that two factor is enabled
  // static bool _twoFactorEnabled = false;
  // bool get twoFactorEnabled => _twoFactorEnabled;
  // set twoFactorEnabled(value){
  //   _twoFactorEnabled = value;
  // }
  // static void setTwoFactorEnabled(value){
  //   _twoFactorEnabled = value;
  // }

  //using for when we leave ConfirmSMSCode Page
  static void resetCodePartsAndPassword(){
    submittedCodePart1.text = '';
    submittedCodePart2.text = '';
    submittedCodePart3.text = '';
    submittedCodePart4.text = '';
    submittedCodePart5.text = '';
    passwordController.text = '';
  }
  //using for when we request to resend sms code
  static void resetCodeParts(){
    submittedCodePart1.text = '';
    submittedCodePart2.text = '';
    submittedCodePart3.text = '';
    submittedCodePart4.text = '';
    submittedCodePart5.text = '';
  }


  //using for timer configuration
  static Timer? timer;
  static void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1), (Timer timer) {
      if (_second == 0) {
        timer.cancel();
      }
      else {
        var newSecond = _second - 1;
        setTimerSecond(newSecond);
      }
    },
    );
  }
  static void restartTimer(){
    setTimerSecond(119);
    timer?.cancel();
    startTimer();
  }
  static void cancelTimer(){
    timer?.cancel();
  }

  static int _second = 119;
  int get second => _second;
  set second(value){
    _second = value;
    update();
  }
  static setTimerSecond(int value){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<ConfirmLoginSMSCodeModel>().second = value:
    _second = value;
  }

  static TimerInitializer? _timerInitializer; // initialize state of Timer before going to ConfirmSMSCodePage
  TimerInitializer? get timerInitializer => _timerInitializer;
  set timerInitializer(value){
    _timerInitializer = value;
  }
  static setTimerForConfirmSMSCodePage(TimerInitializer value){
    _timerInitializer = value;
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
    super.onClose();
  }
  //////////////////////////////////////////////////////////////////////////////

}