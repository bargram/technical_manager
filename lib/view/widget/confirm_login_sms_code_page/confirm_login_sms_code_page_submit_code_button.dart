import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bargram_technical_manager/controller/confirm_login_sms_code_controller.dart';
import 'package:bargram_technical_manager/model/confirm_sms_code_model.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:bargram_technical_manager/utils/string_is_empty.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:bargram_technical_manager/view/widget/shared/widget_size_detector.dart';
import '../../../utils/shared_strings.dart';




class ConfirmLoginSMSCodePageSubmitCodeButton extends StatefulWidget {

  @override
  State<ConfirmLoginSMSCodePageSubmitCodeButton> createState() => _ConfirmLoginSMSCodePageSubmitCodeButtonState();
}

class _ConfirmLoginSMSCodePageSubmitCodeButtonState extends State<ConfirmLoginSMSCodePageSubmitCodeButton> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16), color:const Color(0xFF000000), fontWeight:FontWeight.bold);

  final double widgetBorderRadius = 5;
  final Color widgetColor = const Color(0xFFE8E8E8);
  final double widgetVerticalPadding = 0.02;

  final Color loadingIndicatorColor = Colors.black;
  final double loadingIndicatorSize = 35;

  double? buttonSize; // using for avoiding changing button size by LoadingIndicator

  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{

        //checking submitted code
        if(
        stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart1.text) || //check code entered entirely
            stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart2.text) ||
            stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart3.text) ||
            stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart4.text) ||
            stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart5.text)
        ){
          alert(context:context, title:SharedStrings.validationError, message: SharedStrings.enterEntireCode, isError:true);
          return;
        }

        //checking password
        // if(stringIsEmpty(ConfirmLoginSMSCodeModel.passwordController.text) && ConfirmLoginSMSCodeModel().twoFactorEnabled != null && ConfirmLoginSMSCodeModel().twoFactorEnabled){
        //   alert(context:context, title:'', message: ConfirmSMSCodePageStrings.enterPassword);
        //   return;
        // }


        //run controller
        ConfirmLoginSMSCodeController.run(
            context: context,
            phoneNumber: ConfirmLoginSMSCodeModel().phoneNumber.toString(),
            otpCode: ConfirmLoginSMSCodeModel.submittedCodePart1.text+
                ConfirmLoginSMSCodeModel.submittedCodePart2.text+
                ConfirmLoginSMSCodeModel.submittedCodePart3.text+
                ConfirmLoginSMSCodeModel.submittedCodePart4.text+
                ConfirmLoginSMSCodeModel.submittedCodePart5.text,
            password: ConfirmLoginSMSCodeModel.passwordController.text,
        );

      },
      child: WidgetSize(//using for detecting widget size
        onChange: (Size size){
          setState(() {
            buttonSize = size.height;
          });
        },
        child: Container(
          height: buttonSize ,
          padding: EdgeInsets.symmetric(
            vertical: heightUtil(context,widgetVerticalPadding),
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
              SharedStrings.login,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
