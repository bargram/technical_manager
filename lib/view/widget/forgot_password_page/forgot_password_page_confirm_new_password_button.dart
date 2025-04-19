import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bargram_technical_manager/controller/forgot_password_controller.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:bargram_technical_manager/utils/string_is_empty.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:bargram_technical_manager/view/widget/shared/widget_size_detector.dart';
import '../../../model/forgot_password_model.dart';
import '../../../utils/colors.dart';



class ForgotPasswordPageConfirmNewPasswordButton extends StatefulWidget {

  @override
  State<ForgotPasswordPageConfirmNewPasswordButton> createState() => _ForgotPasswordPageConfirmNewPasswordButtonState();
}

class _ForgotPasswordPageConfirmNewPasswordButtonState extends State<ForgotPasswordPageConfirmNewPasswordButton> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: MyColors.lightBlack);
  final double widgetBorderRadius = 5;
  final Color widgetColor = const Color(0xFFffd800);
  final double widgetVerticalPadding = 0.02;
  final double widgetHorizontalMargin = 0.025;

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
        stringIsEmpty(ForgotPasswordModel.submittedCodePart1.text) || //check code entered entirely
            stringIsEmpty(ForgotPasswordModel.submittedCodePart2.text) ||
            stringIsEmpty(ForgotPasswordModel.submittedCodePart3.text) ||
            stringIsEmpty(ForgotPasswordModel.submittedCodePart4.text) ||
            stringIsEmpty(ForgotPasswordModel.submittedCodePart5.text)
        ){
          alert(context:context, title:'', message: SharedStrings.enterEntireCode);
          return;
        }

        //checking password
        if(stringIsEmpty(ForgotPasswordModel.newPasswordController.text)){
          alert(context:context, title:'', message: SharedStrings.enterPassword);
          return;
        }

        //run controller
        ForgotPasswordController.run(
            context: context,
            phoneNumber: ForgotPasswordModel().phoneNumber!,
            otpCode: ForgotPasswordModel.submittedCodePart1.text+
                ForgotPasswordModel.submittedCodePart2.text+
                ForgotPasswordModel.submittedCodePart3.text+
                ForgotPasswordModel.submittedCodePart4.text+
                ForgotPasswordModel.submittedCodePart5.text,
            password: ForgotPasswordModel.newPasswordController.text,
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
          margin: EdgeInsets.symmetric(
              horizontal: widthUtil(context,widgetHorizontalMargin)
          ),
          decoration: BoxDecoration(
            color: widgetColor,
            borderRadius: BorderRadius.circular(widgetBorderRadius),
          ),
          child: Center(
            child: ForgotPasswordController().loadingState ?
            FittedBox(
              child: SpinKitDualRing(
                color: loadingIndicatorColor,
                size: ScreenUtil().setSp(loadingIndicatorSize),
              ),
            ):
            Text(
              SharedStrings.confirmNewPassword,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
