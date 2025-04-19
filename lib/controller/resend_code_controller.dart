import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/shared_preferences/shared_preferences_manager.dart';
import '../model/dto/last_sending_sms_code_time.dart';
import '../model/dto/service_result/login_service_result.dart';
import '../service/login_service.dart';
import '../view/widget/shared/alert.dart';


//using for resend code in ConfirmSMSCodePage
class ResendCodeController extends GetxController{

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
    changeNotifier ?
    Get.find<ResendCodeController>().loadingState = value:
    _loadingState = value;
  }

  //////////////////////////////////////////////////////////////////////////////



  ////////////////////////////////Method///////////////////////////////////////

  static Future<bool> run({
    required BuildContext context,
    required String phoneNumber,
  })async{
    if(_loadingState == true)return false;//prevent cal controller in loading state
    setLoadingState(true);

    //Sending request to server
    LoginServiceResult result = await LoginService.login(
        phoneNumber: phoneNumber,
        isSignup: false
    );

    if(!result.connection){//handle token expiring event
      setLoadingState(false);
      await alert(context:context, title:'', message:result.message.toString(), isError:true);
      run(context: context, phoneNumber: phoneNumber);
      return false;
    }

    if(result.showMessage){// if result has message
      alert(context:context , title:'', message:result.message.toString());
    }

    if(result.success){//on success

      //save sending sms code time for detect 2 min is over or not
      SharedPreferencesManager.setLastSendingSMSCodeTime(jsonEncode(LastSendingSMSCodeTime.toMap(LastSendingSMSCodeTime(phoneNumber:phoneNumber,dateTime:DateTime.now().toString()))));
      setLoadingState(false);
      return true;

    }

    else if(!result.success){
      setLoadingState(false);
      return false;
    }

    setLoadingState(false);
    return false;
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////Life Cycle Class Managing//////////////////////////
  static bool changeNotifier = false;
  @override
  void onInit() {
    changeNotifier = true;
    super.onInit();
  }
  @override
  void onClose() {
    _loadingState = false;
    changeNotifier = false;
    super.onClose();
  }
  //////////////////////////////////////////////////////////////////////////////

}
