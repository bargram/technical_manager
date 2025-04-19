import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/dbs_manager.dart';
import '../database/shared_preferences/shared_preferences_manager.dart';
import '../model/confirm_sms_code_model.dart';
import '../model/dto/service_result/confirm_sms_code_service_result.dart';
import '../model/dto/user_info.dart';
import '../model/login_model.dart';
import '../service/confirm_sms_code_service.dart';
import '../service/local_service.dart';
import '../utils/logger.dart';
import '../utils/shared_strings.dart';
import '../view/page/login_otp_page.dart';
import '../view/page/main_page.dart';
import '../view/widget/shared/alert.dart';




class ConfirmLoginSMSCodeController extends GetxController{

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
    Get.find<ConfirmLoginSMSCodeController>().loadingState = value:
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
    ConfirmSMSCodeServiceResult result = await ConfirmSMSCodeService.confirm(
        phoneNumber: phoneNumber,
        otpCode: otpCode,
        password:password,
        firebaseToken: 'null'
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

      if(
      // result.verified
      true == true
      ){ // if license and insurance verified then :
        await SharedPreferencesManager.setAccessToken(result.token.toString()); //save access token
        await SharedPreferencesManager.setIsLoggedIn(true); //setting logged in state
        ConfirmLoginSMSCodeModel.resetCodePartsAndPassword(); //reset TextEditingControllers
        await SharedPreferencesManager.setUserInfo(// set user info in local db
            UserInfo(
              name: result.userInfo!['nickname'],
              // profileImagePath: stringIsEmpty(result.driverInfo!['path']) ? null: result.driverInfo!['path'],
              phoneNumber: phoneNumber,
            )
        ); //save driver info
        await LocalService.loadUserInfo(); // load user info to model
        ConfirmLoginSMSCodeModel.cancelTimer();
        LoginModel.reset();
        setLoadingState(false);
        // await alert(context:context, title:'', message:SharedStrings.locationPermissionHint2);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(_) => MainPage()), (route) => false);
      }

      // else{ // if license and insurance not verified then :
      //   await SharedPreferencesManager.setUserInfo(// set user info in local db
      //       UserInfo(
      //         name: result.driverInfo!['name'],
      //         lastName: result.driverInfo!['family'],
      //         phoneNumber: phoneNumber,
      //         scoreNegative: result.driverInfo!['scoreNegative'].toString(),
      //         receiveLoadAnnouncementSmsStatus: result.driverInfo!['smsStatus'] == 1 ? true : false,
      //       )
      //   ); //save driver info
      //   await LocalService.loadUserInfo(); // load user info to model
      //   await SharedPreferencesManager.setAccessToken(result.token); // save access token
      //   ConfirmLoginSMSCodeModel.resetCodePartsAndPassword();//reset TextEditingControllers
      //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(_) => ConfirmDriverPage()), (route) => false);
      // }

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
