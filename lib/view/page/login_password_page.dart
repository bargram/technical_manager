import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/login_model.dart';
import '../../utils/colors.dart';
import '../../utils/shared_strings.dart';
import '../../utils/size_utils.dart';
import '../widget/login_page/login_page_app_logo.dart';
import '../widget/login_page/login_page_confirm_otp_button.dart';
import '../widget/login_page/login_page_confirm_password_button.dart';
import '../widget/login_page/login_page_otp_text.dart';
import '../widget/login_page/login_page_password_text.dart';
import '../widget/shared/custom_text_field.dart';





class LoginPasswordPage extends StatefulWidget {

  @override
  State<LoginPasswordPage> createState() => _LoginPasswordPageState();
}

class _LoginPasswordPageState extends State<LoginPasswordPage> {


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle largeTextStyle = TextStyle(fontSize: ScreenUtil().setSp(16), color:const Color(0xFF2E2E2E));
  final TextStyle smallTextStyle = TextStyle(fontSize: ScreenUtil().setSp(14), color:const Color(0xFF898989));
  final double textFieldHorizontalPadding = 0.05;
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child:Column(
                  children: [
                    Expanded(child:Container()),
                    SizedBox(height:heightUtil(context, 0.05),),
                    LoginPageAppLogo(),
                    SizedBox(height:heightUtil(context, 0.05),),
                    // Text(
                    //   SharedStrings.forLoginIntoAccount,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     color: const Color(0xFF00296B),
                    //     fontSize: ScreenUtil().setSp(18),
                    //     fontWeight: FontWeight.w600,
                    //     height: 0,
                    //   ),
                    // ),
                    // SizedBox(height:heightUtil(context, 0.05),),
                    Row(children: [SizedBox(width:widthUtil(context, 0.05),),Expanded(child: Text(SharedStrings.enterYourPhoneNumber, style: largeTextStyle, textAlign:TextAlign.start,))]),
                    SizedBox(height:heightUtil(context, 0.01),),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthUtil(context,textFieldHorizontalPadding)
                      ),
                      child: CustomTextField(
                        textEditingController: LoginModel.mobileNumberController,
                        label: '',
                        iconData: null,
                        iconPath: null,
                        isNumeric: true,
                        iconColor: MyColors.deepBlue,
                        maxLength: 11,
                      ),
                    ),
                    SizedBox(height:heightUtil(context, 0.015),),
                    Row(children: [SizedBox(width:widthUtil(context, 0.05),),Expanded(child: Text(SharedStrings.enterYourPassword, style: largeTextStyle, textAlign:TextAlign.start,))]),
                    SizedBox(height:heightUtil(context, 0.01),),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthUtil(context,textFieldHorizontalPadding)
                      ),
                      child: CustomTextField(
                        textEditingController: LoginModel.passwordController,
                        label: '',
                        iconData: null,
                        iconPath: null,
                        isNumeric: false,
                        iconColor: MyColors.deepBlue,
                      ),
                    ),
                    SizedBox(height:heightUtil(context, 0.075),),
                    LoginPageConfirmPasswordButton(),
                    SizedBox(height:heightUtil(context, 0.02),),
                    // LoginPageNeedAccount(),
                    Expanded(flex:2,child:Container()),
                    LoginPageOtpText(),
                    SizedBox(height:heightUtil(context, 0.02),),
                    Expanded(flex:2,child:Container()),
                    // LoginPageSupportPhone(),
                    // SizedBox(height:heightUtil(context, 0.05),),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
