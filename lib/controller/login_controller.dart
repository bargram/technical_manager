import 'dart:convert';
import 'package:bargram_technical_manager/model/dto/service_result/general_service_result.dart';
import 'package:flutter/material.dart';
import 'package:bargram_technical_manager/database/shared_preferences/shared_preferences_manager.dart';
import 'package:get/get.dart';

import '../model/confirm_sms_code_model.dart';
import '../model/dto/last_sending_sms_code_time.dart';
import '../model/dto/service_result/login_service_result.dart';
import '../model/dto/timer_initializer.dart';
import '../service/login_service.dart';
import '../utils/exit_from_current_focus.dart';
import '../view/page/confirm_login_sms_code_page.dart';
import '../view/widget/shared/alert.dart';
import '../view/widget/shared/error_connection_dialog.dart';





class LoginController extends GetxController{

  ////////////////////////////////States///////////////////////////////////////

  //using for show loading state in UI
  static bool _loadingState = false;
  bool get loadingState => _loadingState;
  set loadingState(value){
    _loadingState = value;
    update();
  }
  static setLoadingState(value){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    isRealTime ?
    Get.find<LoginController>().loadingState = value:
    _loadingState = value;
  }

  //////////////////////////////////////////////////////////////////////////////



  ////////////////////////////////Method///////////////////////////////////////

  static Future run({
    required BuildContext context,
    required String phoneNumber,
  })async{
    if(_loadingState == true)return;//prevent cal controller in loading state
    setLoadingState(true);

    //Sending request to server
    LoginServiceResult result = await LoginService.login(
        phoneNumber: phoneNumber,
        isSignup: false
    );

    if(!result.connection){//handle connection problem event
      setLoadingState(false);
      errorConnectionDialog(
          context:context,
          title:'',
          message:result.message.toString(),
          onRetry:()=> run(context: context, phoneNumber: phoneNumber)
      );
      return;
    }

    if(result.showMessage){// if result has message
      alert(context:context , title:'', message:result.message.toString());
    }

    if(result.success || result.redirectPageName != null && result.redirectPageName == 'otp'){//on success
      ConfirmLoginSMSCodeModel.setPhoneNumberForConfirmSMSCode(phoneNumber); // set phone number for showing ConfirmSMSCodePage
      // ConfirmLoginSMSCodeModel.setTwoFactorEnabled(result.twoFactorEnabled ?? false); // set two factor state for showing password field in ConfirmSMSCodePage

      //initialize Timer for ConfirmSMSCodePage
      ConfirmLoginSMSCodeModel.setTimerForConfirmSMSCodePage(TimerInitializer(alive:false,initValue:null));

      //save sending sms code time for detect 2 min is over or not
      SharedPreferencesManager.setLastSendingSMSCodeTime(jsonEncode(LastSendingSMSCodeTime.toMap(LastSendingSMSCodeTime(phoneNumber:phoneNumber,dateTime:DateTime.now().toString()))));

      //go to confirm sms code page
      Navigator.of(context).push(MaterialPageRoute(builder:(_) => ConfirmLoginSMSCodePage()));
    }

    if(result.redirectPageName != null && result.redirectPageName == 'SignUpPage'){ // handling route order from server
      setLoadingState(false); // we doing this for preventing showing loading when alert dialog opened
      await alert(context:context , title:'', message:result.message.toString());
      exitFromCurrentFocus(context); //unFocusing current focus on text field
      // Navigator.push(context, MaterialPageRoute(builder:(_)=> SignupPage()));
      return;
    }

    setLoadingState(false);
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////Life Cycle Class Managing//////////////////////////
  static bool isRealTime = false;
  @override
  void onInit() {
    isRealTime = true;
    super.onInit();
  }
  @override
  void onClose() {
    isRealTime = false;
    super.onClose();
  }
//////////////////////////////////////////////////////////////////////////////

}
