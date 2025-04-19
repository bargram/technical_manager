import 'package:bargram_technical_manager/utils/colors.dart';
import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/model/confirm_sms_code_model.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';

import '../../../controller/resend_code_controller.dart';





class ConfirmLoginSMSCodePageResendCode extends StatefulWidget {
  @override
  State<ConfirmLoginSMSCodePageResendCode> createState() => _ConfirmLoginSMSCodePageResendCodeState();
}

class _ConfirmLoginSMSCodePageResendCodeState extends State<ConfirmLoginSMSCodePageResendCode> {

  //////////////////////////////Timer Configuration/////////////////////////////

  void detectTimerInitializerStatusAndSetTimer(){
    //ConfirmLoginSMSCodeModel().timerInitializer.alive initialized before we come to this page
    if(ConfirmLoginSMSCodeModel().timerInitializer!.alive == true){
      if(DateTime.now().difference(DateTime.parse(ConfirmLoginSMSCodeModel().timerInitializer!.initValue!)).inSeconds > 0){
        ConfirmLoginSMSCodeModel.setTimerSecond(119 - DateTime.now().difference(DateTime.parse(ConfirmLoginSMSCodeModel().timerInitializer!.initValue!)).inSeconds);
      }
      ConfirmLoginSMSCodeModel.startTimer();
    }
    else{
      ConfirmLoginSMSCodeModel.startTimer();
    }
  }

  //////////////////////////////End Of Timer Configuration//////////////////////



  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle greenTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.green);
  final TextStyle redTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.red);
  final double widgetHorizontalMargin = 0.05;
  //////////////////////////////End Of Widget Styles////////////////////////////


  //Calling when this widget constructing
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      detectTimerInitializerStatusAndSetTimer();
    });
  }

  //Calling when this widget destructing
  @override
  void dispose() {
    ConfirmLoginSMSCodeModel.timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: ()async{
          if(ConfirmLoginSMSCodeModel().second != 0){
            return;
          }

          //run controller
          if(await ResendCodeController.run(context: context, phoneNumber: ConfirmLoginSMSCodeModel().phoneNumber!) == true){
          // if code resent then:
            ConfirmLoginSMSCodeModel.resetCodeParts(); //clear code text fields
            ConfirmLoginSMSCodeModel.restartTimer();
          }
        },
        child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: widthUtil(context,widgetHorizontalMargin)
        ),

        child: ConfirmLoginSMSCodeModel().second != 0 ?
        Text(
          //showing counter text due its state
          '${SharedStrings.smsCodeValidity} ${ConfirmLoginSMSCodeModel().second} ${SharedStrings.second}',
          style: greenTextStyle,
        ):
        Text(
          SharedStrings.resendCode,
          style: redTextStyle,
        )
       ),
      );
  }
}
