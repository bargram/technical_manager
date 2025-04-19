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

import '../../../controller/confirm_login_sms_code_controller.dart';
import '../../../model/confirm_sms_code_model.dart';
import '../../../model/dto/last_sending_sms_code_time.dart';
import '../../../model/dto/timer_initializer.dart';
import '../../../utils/shared_strings.dart';
import '../../page/confirm_login_sms_code_page.dart';





class LoginPageConfirmPasswordButton extends StatefulWidget {

  @override
  State<LoginPageConfirmPasswordButton> createState() => _LoginPageConfirmPasswordButtonState();
}

class _LoginPageConfirmPasswordButtonState extends State<LoginPageConfirmPasswordButton> {

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
      GetBuilder<ConfirmLoginSMSCodeController>(init: ConfirmLoginSMSCodeController(), builder: (_) => // Initialize ConfirmLoginSMSCodeController Class For RealTime Data Using GetX State Management
      GestureDetector(
      onTap: ()async{

        ConfirmLoginSMSCodeController.run(
          context: context,
          phoneNumber: LoginModel.mobileNumberController.text,
          otpCode: '',
          password: LoginModel.passwordController.text,
        );
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
            child: ConfirmLoginSMSCodeController().loadingState ?
             FittedBox(
              child: SpinKitDualRing(
                color: loadingIndicatorColor,
                size: ScreenUtil().setSp(loadingIndicatorSize),
              ),
            ):
            Text(
              SharedStrings.loginWithPassword,
              style: textStyle,
            ),
          ),
        ),
      ),
    ));
  }

  

}
