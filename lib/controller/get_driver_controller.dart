import 'dart:typed_data';
import 'package:bargram_technical_manager/model/dto/driver_car.dart';
import 'package:bargram_technical_manager/model/dto/enum/check_list_status.dart';
import 'package:bargram_technical_manager/model/dto/service_result/general_service_result.dart';
import 'package:bargram_technical_manager/model/shared_model.dart';
import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:bargram_technical_manager/database/shared_preferences/shared_preferences_manager.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:jdate/jdate.dart';
import 'package:mac_address/mac_address.dart';
import '../database/dbs_manager.dart';
import '../model/dto/enum/get_driver_step.dart';
import '../model/register_check_list_model.dart';
import '../service/check_list_service.dart';
import '../view/page/login_otp_page.dart';
import 'get_all_registered_check_list_controller.dart';




class GetDriverController extends GetxController{

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
    Get.find<GetDriverController>().loadingState = value:
    _loadingState = value;
  }

  //////////////////////////////////////////////////////////////////////////////


  ////////////////////////////////Method///////////////////////////////////////
  static Future run({
    required BuildContext context,
    required String nationalCode,
    required String mobileNumber,
    required bool recursive,
  })async{
    if(_loadingState == true)return;//prevent cal controller in loading state
    setLoadingState(true);

    RegisterCheckListModel.setCars(<DriverCar>[]);

    EasyLoading.show(status:SharedStrings.wait);

    //Sending request to server
    GeneralServiceResult result = await CheckListService.getDriver(
      nationalCode:nationalCode,
      mobileNumber:mobileNumber,
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

    if(result.message.toString() == 'راننده در سیستم ثبت نام نشده است لطفا شماره موبایل جهت ثبت نام وارد کنید'){
      RegisterCheckListModel.setGetDriverStep(GetDriverStep.mobileNumber);
    }

    if(result.success){//on success
      RegisterCheckListModel.setDriverName(result.data['name'].toString()+' '+result.data['family'].toString());
      RegisterCheckListModel.setDriverId(result.data['id'].toString());

      //Filling car list model
      List<DriverCar> _cars = <DriverCar>[];
      for(int i = 0; i < result.data['cars'].length; i++){
        _cars.add(
            DriverCar(
              id: result.data['cars'][i]['id'].toString(),
              smartCode: result.data['cars'][i]['smartIdCar'].toString(),
              plaque: result.data['cars'][i]['plaque'],
              carTypeTitle: result.data['cars'][i]['car_type'] == null ? SharedStrings.unknown : result.data['cars'][i]['car_type']['title'].toString(),
              technicalDiagnosisDate:
              result.data['cars'][i]['date_technical_inspection'].toString()=='null'?'مشخص نشده':
              DateTime.parse(result.data['cars'][i]['date_technical_inspection'].toString()).toJDate().year.toString()+'/'+
                  DateTime.parse(result.data['cars'][i]['date_technical_inspection'].toString()).toJDate().month.toString()+'/'+
                  DateTime.parse(result.data['cars'][i]['date_technical_inspection'].toString()).toJDate().day.toString(),
              rahdariStatus: result.data['cars'][i]['status'] == 1 ? true : false,
              defaultStatus:  result.data['cars'][i]['default'] == 1 ? true : false,
              selected: false,
            )
        );
      }

      RegisterCheckListModel.setCars(_cars);
      if(_cars.isEmpty){
        setLoadingState(false);
        RegisterCheckListModel.setGetDriverStep(GetDriverStep.smartCode);
        if(recursive == true){
          GetDriverController.run(
            context: context,
            nationalCode:RegisterCheckListModel.driverNationalCodeController.text,
            mobileNumber:'',
            recursive:false,
          );
        }

      }
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
