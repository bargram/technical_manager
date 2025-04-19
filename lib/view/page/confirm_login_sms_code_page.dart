import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controller/confirm_login_sms_code_controller.dart';
import '../../model/confirm_sms_code_model.dart';
import '../../utils/colors.dart';
import '../../utils/size_utils.dart';
import '../widget/confirm_login_sms_code_page/confirm_login_sms_code_page_back_button.dart';
import '../widget/confirm_login_sms_code_page/confirm_login_sms_code_page_edit_phone_number.dart';
import '../widget/confirm_login_sms_code_page/confirm_login_sms_code_page_hint.dart';
import '../widget/confirm_login_sms_code_page/confirm_login_sms_code_page_resend_code.dart';
import '../widget/confirm_login_sms_code_page/confirm_login_sms_code_page_submit_code_button.dart';
import '../widget/confirm_login_sms_code_page/confirm_login_sms_code_page_submitted_code.dart';
import '../widget/login_page/login_page_support_phone.dart';
import '../widget/shared/custom_divider.dart';



class ConfirmLoginSMSCodePage extends StatefulWidget {

  @override
  State<ConfirmLoginSMSCodePage> createState() => _ConfirmLoginSMSCodePageState();
}

class _ConfirmLoginSMSCodePageState extends State<ConfirmLoginSMSCodePage> {


  //////////////////////////////Widget Styles///////////////////////////////////
  final Color backgroundColor = MyColors.white;
  final double widgetHorizontalPadding = 0.05;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ConfirmLoginSMSCodeModel.cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<ConfirmLoginSMSCodeController>(init: ConfirmLoginSMSCodeController(), builder: (_) => // Initialize ConfirmLoginSMSCodeController Class For RealTime Data Using GetX State Management
      GetBuilder<ConfirmLoginSMSCodeModel>(init: ConfirmLoginSMSCodeModel(), builder: (_) => // Initialize ConfirmLoginSMSCodeModel Class For RealTime Data Using GetX State Management
      Scaffold(
        backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal:widthUtil(context, widgetHorizontalPadding)
          ),
          child: Column(
            children: [
              SizedBox(height:heightUtil(context,0.025),),
              ConfirmLoginSMSCodePageBackButton(),
              SizedBox(height:heightUtil(context,0.025),),
              // SizedBox(height:heightUtil(context,0.05),),
              Row(
                children: [
                  Expanded(child: ConfirmLoginSMSCodePageHint()),
                  SizedBox(width:widthUtil(context, 0.01),),
                  ConfirmLoginSMSCodePageEditPhoneNumber(),
                ],
              ),
              SizedBox(height:heightUtil(context,0.05),),
              ConfirmLoginSMSCodePageSubmitted(),
              // ConfirmLoginSMSCodeModel().twoFactorEnabled != null && ConfirmLoginSMSCodeModel().twoFactorEnabled ? SizedBox(height:heightUtil(context,0.025),) : Container(),
              // ConfirmLoginSMSCodeModel().twoFactorEnabled != null && ConfirmLoginSMSCodeModel().twoFactorEnabled ? ConfirmLoginSMSCodePagePasswordField() : Container(),
              SizedBox(height:heightUtil(context,0.025),),
              Expanded(child:Container()),
              ConfirmLoginSMSCodePageResendCode(),
              SizedBox(height:heightUtil(context,0.025),),
              LoginPageSupportPhone(),
              // SizedBox(height:heightUtil(context,0.015),),
              CustomDivider(height:1, width:widthUtil(context, 0.9), color:MyColors.grey, borderRadius:20,),
              SizedBox(height:heightUtil(context,0.025),),
              ConfirmLoginSMSCodePageSubmitCodeButton(),
              SizedBox(height:heightUtil(context,0.03),),
            ],
          ),
        ),
      ),
    )
    ));
  }
}
