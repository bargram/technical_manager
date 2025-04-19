import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bargram_technical_manager/controller/login_controller.dart';
import 'package:bargram_technical_manager/database/shared_preferences/shared_preferences_manager.dart';
import 'package:bargram_technical_manager/model/login_model.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:bargram_technical_manager/utils/string_is_empty.dart';
import 'package:bargram_technical_manager/view/widget/shared/widget_size_detector.dart';
import 'package:get/get.dart';

import '../../../model/confirm_sms_code_model.dart';
import '../../../model/dto/last_sending_sms_code_time.dart';
import '../../../model/dto/timer_initializer.dart';
import '../../../utils/shared_strings.dart';
import '../../page/confirm_login_sms_code_page.dart';





class LoginPageConfirmOtpButton extends StatefulWidget {

  @override
  State<LoginPageConfirmOtpButton> createState() => _LoginPageConfirmOtpButtonState();
}

class _LoginPageConfirmOtpButtonState extends State<LoginPageConfirmOtpButton> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16), color:const Color(0xFF000000), fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  // final Color widgetColor = const Color(0xFF39b9ea);
  final double widgetVerticalPadding = 0.02;
  final double widgetHorizontalMargin = 0.05;
  final Color widgetColor = const Color(0xFFE8E8E8);

  final Color loadingIndicatorColor = Colors.black;
  final double loadingIndicatorSize = 35;
  double? buttonSize; // using for avoiding changing button size by LoadingIndicator

  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<LoginController>(init: LoginController(), builder: (_) => // Initialize LoginController Class For RealTime Data Using GetX State Management
      GestureDetector(
      onTap: ()async{

        //loading last sending sms code time from local database
        String lastSendingSMSCodeTimeFromDB = await SharedPreferencesManager.getLastSendingSMSCodeTime();
        if(stringIsEmpty(lastSendingSMSCodeTimeFromDB)){ // if last sending sms code time in null then :
          return scenario1();
        }
        else{ // if last sending sms code time in not null then :
          //convert data to object
          LastSendingSMSCodeTime time = LastSendingSMSCodeTime.fromMap(jsonDecode(lastSendingSMSCodeTimeFromDB));
          //if time difference is lower than 2 minutes then :
          if(DateTime.now().difference(DateTime.parse(time.dateTime)).inSeconds < 120
          && time.phoneNumber == LoginModel.mobileNumberController.text){
            return scenario2(context,time,LoginModel.mobileNumberController.text);
          }
          else {//if time difference is more than 2 minutes then :
            return scenario1();
          }
        }
      },
      child: WidgetSize(//using for detecting widget size
        onChange: (Size size){
          setState(() {
            buttonSize = size.height;
          });
        },
        child: Container(
          height: buttonSize,
          padding: EdgeInsets.symmetric(
            vertical: heightUtil(context,widgetVerticalPadding),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: widthUtil(context,widgetHorizontalMargin)
          ),
          decoration: BoxDecoration(
            color: widgetColor,
            borderRadius: BorderRadius.circular(widgetBorderRadius),
          ),
          child: Center(
            child: LoginController().loadingState ?
             FittedBox(
              child: SpinKitDualRing(
                color: loadingIndicatorColor,
                size: ScreenUtil().setSp(loadingIndicatorSize),
              ),
            ):
            Text(
              SharedStrings.loginWithOtp,
              style: textStyle,
            ),
          ),
        ),
      ),
    ));
  }

  //Normal scenario
  Future<void> scenario1()async{

    //phone number validation
    if(stringIsEmpty(LoginModel.mobileNumberController.text)){
      alert(context:context , title:SharedStrings.validationError, message:SharedStrings.enterPhoneNumber, isError:true);
      return;
    }
    if(LoginModel.mobileNumberController.text.length < 11){
      alert(context:context , title:SharedStrings.validationError, message:SharedStrings.enterPhoneNumberCorrect, isError:true);
      return;
    }

    //run controller
    await LoginController.run(
      context:      context,
      phoneNumber:  LoginModel.mobileNumberController.text,
    );
  }

  //if user came back from ConfirmSMSCodePage and if time difference is lower that 2 minutes
  Future<void> scenario2(BuildContext context,LastSendingSMSCodeTime time,String phoneNumber)async{
    ConfirmLoginSMSCodeModel.setTimerForConfirmSMSCodePage(TimerInitializer(alive:true,initValue:time.dateTime));
    ConfirmLoginSMSCodeModel.setPhoneNumberForConfirmSMSCode(phoneNumber);// set phone number for showing ConfirmSMSCodePage
    Navigator.of(context).push(MaterialPageRoute(builder:(_) => ConfirmLoginSMSCodePage()));
  }

}
