import 'package:bargram_technical_manager/model/dto/service_result/general_service_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/dbs_manager.dart';
import '../service/confirm_sms_code_service.dart';
import '../view/page/login_otp_page.dart';
import '../view/widget/shared/alert.dart';


class ForgotPasswordController extends GetxController{

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
    Get.find<ForgotPasswordController>().loadingState = value:
    _loadingState = value;
  }

  //////////////////////////////////////////////////////////////////////////////



  ////////////////////////////////Method///////////////////////////////////////

  static Future run({
    required BuildContext context,
    required String phoneNumber,
    required String otpCode,
    required String password,
  })async{
    if(_loadingState == true)return;//prevent cal controller in loading state
    setLoadingState(true);

    //Sending request to server
    GeneralServiceResult result = await ConfirmSMSCodeService.forgotPassword(
        phoneNumber: phoneNumber,
        otpCode: otpCode,
        password:password,
    );

    if(result.tokenExp){//handle token expiring event
      setLoadingState(false);
      await DBsManager.deleteDBsData();
      await alert(context:context, title:'', message:result.message.toString(), isError:true);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(_) => LoginOtpPage()), (route) => false);
      return;
    }

    if(!result.connection){//handle connection problem event
      setLoadingState(false);
      await alert(context:context, title:'', message:result.message.toString(), isError:true);
      run(context: context, phoneNumber: phoneNumber, otpCode: otpCode, password: password);
      return;
    }

    if(result.showMessage){// if result has message
      alert(context:context , title:'', message:result.message.toString());
    }

    if(result.success){//on success
      setLoadingState(false); // we doing this for preventing showing loading when alert dialog opened
      await alert(context:context , title:'', message:result.message.toString());
      Navigator.pop(context);
    }

    setLoadingState(false);
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
