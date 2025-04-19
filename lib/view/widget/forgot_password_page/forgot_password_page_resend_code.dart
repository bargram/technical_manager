import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:bargram_technical_manager/controller/resend_code_controller.dart';
import 'package:bargram_technical_manager/model/confirm_sms_code_model.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../model/forgot_password_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';




class ForgotPasswordPageResendCode extends StatefulWidget {
  @override
  State<ForgotPasswordPageResendCode> createState() => _ForgotPasswordPageResendCodeState();
}

class _ForgotPasswordPageResendCodeState extends State<ForgotPasswordPageResendCode> {


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle counterTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.lightBlack);
  final TextStyle enableResendTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.lightBlack);
  final TextStyle disableResendTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.lightBlack.withOpacity(0.4));

  final double widgetHorizontalMargin = 0.025;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<ForgotPasswordModel>(init: ForgotPasswordModel(), builder: (_) => // Initialize ForgotPasswordModel Class For RealTime Data Using GetX State Management
      GetBuilder<ConfirmLoginSMSCodeModel>(init: ConfirmLoginSMSCodeModel(), builder: (_) => // Initialize ConfirmLoginSMSCodeModel Class For RealTime Data Using GetX State Management
      Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child: Row(
        children: [
          Text(
            //showing counter text due its state
            ConfirmLoginSMSCodeModel().second.toString(),
            style: counterTextStyle,
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: ()async{
              if(ConfirmLoginSMSCodeModel().second != 0){
                return;
              }

              //run controller
              if(await ResendCodeController.run(context: context, phoneNumber: ConfirmLoginSMSCodeModel().phoneNumber!) == true){
                // if code resent then:
                ForgotPasswordModel.resetCodeParts(); //clear code text fields
                ConfirmLoginSMSCodeModel.restartTimer();
              }
            },
            child: Text(
              SharedStrings.resendCode,
              style: ConfirmLoginSMSCodeModel().second == 0 ? enableResendTextStyle : disableResendTextStyle,
            ),
          ),
        ],
      )
    )
      ));
  }
}
