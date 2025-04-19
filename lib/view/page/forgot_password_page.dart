
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:bargram_technical_manager/controller/forgot_password_controller.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:bargram_technical_manager/view/widget/forgot_password_page/forgot_password_page_back_button.dart';
import 'package:bargram_technical_manager/view/widget/forgot_password_page/forgot_password_page_hint.dart';
import 'package:bargram_technical_manager/view/widget/forgot_password_page/forgot_password_page_new_password_field.dart';
import 'package:bargram_technical_manager/view/widget/forgot_password_page/forgot_password_page_resend_code.dart';
import 'package:bargram_technical_manager/view/widget/forgot_password_page/forgot_password_page_confirm_new_password_button.dart';
import 'package:bargram_technical_manager/view/widget/forgot_password_page/forgot_password_page_submitted_code.dart';
import 'package:bargram_technical_manager/view/widget/login_page/login_page_app_logo.dart';

import '../../controller/forgot_password_controller.dart';
import '../../utils/size_utils.dart';


class ForgotPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<ForgotPasswordController>(init: ForgotPasswordController(), builder: (_) => // Initialize ForgotPasswordController Class For RealTime Data Using GetX State Management
      Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent:NeverScrollableScrollPhysics()),
          child: SizedBox(
            height: heightUtil(context,1) - safeAreaSizeUtil(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ForgotPasswordPageBackButton(),
                LoginPageAppLogo(),
                SizedBox(height:heightUtil(context,0.05),),
                ForgotPasswordPageHint(),
                SizedBox(height:heightUtil(context,0.05),),
                ForgotPasswordPageSubmitted(),
                SizedBox(height:heightUtil(context,0.025),),
                ForgotPasswordPageNewPasswordField(),
                SizedBox(height:heightUtil(context,0.025),),
                ForgotPasswordPageResendCode(),
                Expanded(child:Container()),
                SizedBox(height:heightUtil(context,0.025),),
                ForgotPasswordPageConfirmNewPasswordButton(),
                SizedBox(height:heightUtil(context,0.01),),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}
