import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/model/confirm_sms_code_model.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:bargram_technical_manager/view/page/forgot_password_page.dart';
import '../../../model/forgot_password_model.dart';
import '../../../utils/colors.dart';




class ForgotPasswordPageForgotPassowrd extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.lightBlack);

  final double widgetHorizontalMargin = 0.025;
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child: Row(
        children: [
          Expanded(child: Container()),
          GestureDetector(
            onTap: ()async{
              ForgotPasswordModel.setPhoneNumberForForgotPassword(ConfirmLoginSMSCodeModel().phoneNumber.toString());
              Navigator.push(context,MaterialPageRoute(builder:(_)=> ForgotPasswordPage()));
            },
            child: Text(
              SharedStrings.forgotPassword,
              style: textStyle,
            ),
          ),
        ],
      )
    );
  }
}
