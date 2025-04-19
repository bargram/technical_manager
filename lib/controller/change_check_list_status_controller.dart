import 'dart:typed_data';
import 'package:bargram_technical_manager/model/dto/enum/check_list_status.dart';
import 'package:bargram_technical_manager/model/dto/service_result/general_service_result.dart';
import 'package:bargram_technical_manager/model/shared_model.dart';
import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:bargram_technical_manager/database/shared_preferences/shared_preferences_manager.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:mac_address/mac_address.dart';
import '../database/dbs_manager.dart';
import '../service/check_list_service.dart';
import '../view/page/login_otp_page.dart';
import 'get_all_registered_check_list_controller.dart';




class ChangeCheckListStatusController extends GetxController{

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
    Get.find<ChangeCheckListStatusController>().loadingState = value:
    _loadingState = value;
  }

  //////////////////////////////////////////////////////////////////////////////


  ////////////////////////////////Method///////////////////////////////////////
  static Future run({
    required BuildContext context,
    required String id,
    required CheckListStatus status,
  })async{
    if(_loadingState == true)return;//prevent cal controller in loading state
    setLoadingState(true);

    EasyLoading.show(status:SharedStrings.wait);

    //Sending request to server
    GeneralServiceResult result = await CheckListService.changeStatus(
      status: status.name,
      id:id,
    );

    EasyLoading.dismiss();

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
      return;
    }

    if(result.showMessage){// if result has message
      alert(context:context , title:'', message:result.message.toString());
    }

    if(result.success){//on success
      Navigator.pop(context);
      GetAllRegisteredCheckListController.run(context: context);
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
