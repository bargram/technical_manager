import 'package:bargram_technical_manager/utils/logger.dart';
import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:jdate/jdate.dart';
import '../database/dbs_manager.dart';
import '../model/dto/check_list_car.dart';
import '../model/dto/check_list.dart';
import '../model/dto/enum/check_list_status.dart';
import '../model/dto/service_result/general_service_result.dart';
import '../model/registered_check_list_model.dart';
import '../service/check_list_service.dart';
import '../view/page/login_otp_page.dart';




class GetAllRegisteredCheckListController extends GetxController{

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
    Get.find<GetAllRegisteredCheckListController>().loadingState = value:
    _loadingState = value;
  }

  //////////////////////////////////////////////////////////////////////////////


  ////////////////////////////////Method///////////////////////////////////////
  static Future run({
    required BuildContext context,
  })async{
    if(_loadingState == true)return;//prevent cal controller in loading state
    setLoadingState(true);

    RegisteredCheckListModel.resetPaginateIndex();

    //Sending request to server
    GeneralServiceResult result = await CheckListService.getAll();

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
      run(context: context);
      return;
    }

    if(result.showMessage){// if result has message
      alert(context:context , title:'', message:result.message.toString());
    }

    if(result.success){//on success

      //Filling turns list model
      List<CheckList> _checkList = <CheckList>[];

      for(int i = 0; i < result.data!.length; i++){
        JDate createdDateTime = DateTime.parse(result.data![i]['created_at'].toString()).toJDate();
        JDate capsuleDate = DateTime.parse(result.data![i]['tarikh_kapsol_atashneshani'].toString()).toJDate();
        JDate technicalLicenseDate = DateTime.parse(result.data![i]['govahiname_fani_motabar'].toString()).toJDate();
        // Logger.consolePrint(result.data![i]);
        _checkList.add(
            CheckList(
              status:
              result.data![i]['status'] == 'CONFIRM'? CheckListStatus.CONFIRM:
              result.data![i]['status'] == 'PENDING'? CheckListStatus.PENDING:
              CheckListStatus.REJECTED,
              car: result.data![i]['car'] == null? null :
              CheckListCar(
                id: result.data[i]['car']['id'].toString(),
                smartCode: result.data[i]['car']['smartIdCar'].toString(),
                plaquePart1: result.data[i]['car']['plq1'].toString(),
                plaquePart2: result.data[i]['car']['plq2'].toString(),
                plaquePart3: result.data[i]['car']['plq3'].toString(),
                plaquePart4: result.data[i]['car']['shomare_serial_plaque'].toString(),
              ),
              // car: Car(),
              driverName: result.data![i]['driver'] == null?
                SharedStrings.unknown:
              result.data![i]['driver']['name'].toString()+' '+result.data![i]['driver']['family'].toString(),
              id: result.data![i]['id'].toString(),
              capsuleDate: '${capsuleDate.year}/${capsuleDate.month}/${capsuleDate.day}',
              technicalLicenseDate: '${technicalLicenseDate.year}/${technicalLicenseDate.month}/${technicalLicenseDate.day}',
              signatureUrl: result.data![i]['emza'].toString(),
              ip: result.data![i]['ip'].toString(),
              trackingCode: result.data![i]['rahgiry'].toString(),
              createdTime: '${
                  createdDateTime.hour < 10 && createdDateTime.minute < 10? '0${createdDateTime.hour}:0${createdDateTime.minute}':
                  createdDateTime.hour < 10 ? '0${createdDateTime.hour}:${createdDateTime.minute}':
                  createdDateTime.minute < 10 ? '${createdDateTime.hour}:0${createdDateTime.minute}':'${createdDateTime.hour}:${createdDateTime.minute}'
              }',
              createdDate: '${createdDateTime.year}/${createdDateTime.month}/${createdDateTime.day}',
            )
        );
      }

      RegisteredCheckListModel.setCheckLists(_checkList);

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
