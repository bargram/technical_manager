import 'dart:typed_data';
import 'package:bargram_technical_manager/controller/get_all_registered_check_list_controller.dart';
import 'package:bargram_technical_manager/model/dto/service_result/general_service_result.dart';
import 'package:bargram_technical_manager/model/register_check_list_model.dart';
import 'package:bargram_technical_manager/model/shared_model.dart';
import 'package:bargram_technical_manager/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bargram_technical_manager/database/shared_preferences/shared_preferences_manager.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import '../database/dbs_manager.dart';
import '../service/check_list_service.dart';
import '../view/page/login_otp_page.dart';




class RegisterCheckListController extends GetxController{

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
    Get.find<RegisterCheckListController>().loadingState = value:
    _loadingState = value;
  }

  //////////////////////////////////////////////////////////////////////////////


  ////////////////////////////////Method///////////////////////////////////////
  static Future run({
    required BuildContext context,
    required Uint8List signatureImage,
    required String carId,
    required String nationalCode,
    required String govahiname_fani_motabar,
    required bool salamat_zaheri_ring_lastik,
    required bool hade_aqal_aj_lastik,
    required bool salamat_sistem_satmayeshi_garmayeshi,
    required bool salamat_barf_pak_kon,
    required bool salamat_shishe_jolo,
    required bool jabe_komak_haye_avaliye,
    required bool mosalas_shabrang_va_cheraq_cheshmak_zan,
    required bool cheraq_jolo_aqab_neshanegar_janebi,
    required bool sheraq_rahnama_boq_ayene,
    required bool alaem_hoshdar,
    required bool vaziyate_zaheri,
    required bool hefazhaye_janebi,
    required bool salamat_kamarband,
    required bool tajhizat_etesali_be_keshande,
    required bool salamat_amalkard_tormoz,
    required bool amade_be_kar_bodan_sanjesh_sorat_zaman,
    required bool vaziyat_sistem_farman,
    required bool adam_taqir_ajzaye_fani,
    required bool zanjir_charkh_tajhizat_pashesh_gel,
    required bool salamat_sabet_bodan_mahal_batry,
    required bool vaziyate_makhzan_sokht,
    required bool nadashtan_dod,
    required bool tatbiq_pelak,
    required bool adam_nasb_tajhizat_qeyr_zaror,
    required bool roayat_mane_moqararat,
    required bool mahar_sahih_bar_va_chideman,
    required String tarikh_kapsol_atashneshani,
  })async{
    if(_loadingState == true)return;//prevent cal controller in loading state
    setLoadingState(true);
    try{

      //Sending request to server
      GeneralServiceResult result = await CheckListService.register(
          token: (await SharedPreferencesManager.getAccessToken()),
          macAddress: 'await GetMac.macAddress',
          nationalCode: nationalCode,
          carId: carId,
          signatureImage: signatureImage,
          govahiname_fani_motabar: govahiname_fani_motabar,
          salamat_zaheri_ring_lastik: salamat_zaheri_ring_lastik,
          hade_aqal_aj_lastik: hade_aqal_aj_lastik,
          salamat_sistem_satmayeshi_garmayeshi: salamat_sistem_satmayeshi_garmayeshi,
          salamat_barf_pak_kon: salamat_barf_pak_kon,
          salamat_shishe_jolo: salamat_shishe_jolo,
          jabe_komak_haye_avaliye: jabe_komak_haye_avaliye,
          mosalas_shabrang_va_cheraq_cheshmak_zan: mosalas_shabrang_va_cheraq_cheshmak_zan,
          cheraq_jolo_aqab_neshanegar_janebi: cheraq_jolo_aqab_neshanegar_janebi,
          sheraq_rahnama_boq_ayene: sheraq_rahnama_boq_ayene,
          alaem_hoshdar: alaem_hoshdar,
          vaziyate_zaheri: vaziyate_zaheri,
          hefazhaye_janebi: hefazhaye_janebi,
          salamat_kamarband: salamat_kamarband,
          tajhizat_etesali_be_keshande: tajhizat_etesali_be_keshande,
          salamat_amalkard_tormoz: salamat_amalkard_tormoz,
          amade_be_kar_bodan_sanjesh_sorat_zaman: amade_be_kar_bodan_sanjesh_sorat_zaman,
          vaziyat_sistem_farman: vaziyat_sistem_farman,
          adam_taqir_ajzaye_fani: adam_taqir_ajzaye_fani,
          zanjir_charkh_tajhizat_pashesh_gel: zanjir_charkh_tajhizat_pashesh_gel,
          salamat_sabet_bodan_mahal_batry: salamat_sabet_bodan_mahal_batry,
          vaziyate_makhzan_sokht: vaziyate_makhzan_sokht,
          nadashtan_dod: nadashtan_dod,
          tatbiq_pelak: tatbiq_pelak,
          adam_nasb_tajhizat_qeyr_zaror: adam_nasb_tajhizat_qeyr_zaror,
          roayat_mane_moqararat: roayat_mane_moqararat,
          mahar_sahih_bar_va_chideman: mahar_sahih_bar_va_chideman,
          tarikh_kapsol_atashneshani: tarikh_kapsol_atashneshani
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
        return;
      }

      if(result.showMessage){// if result has message
        alert(context:context , title:'', message:result.message.toString());
      }

      if(result.success){//on success
        setLoadingState(false);
        await alert(context:context, title:'', message:result.message.toString());
        SharedModel.setHasTodayCheckList(true);
        RegisterCheckListModel.reset();
        GetAllRegisteredCheckListController.run(context: context);
        Navigator.pop(context);
      }
    }catch(e){
      Logger.consolePrint(e);
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
