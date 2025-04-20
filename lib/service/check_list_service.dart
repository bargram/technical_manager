
import 'dart:convert';
import 'dart:io';
import 'package:bargram_technical_manager/model/registered_check_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:bargram_technical_manager/utils/json_helper.dart';
import 'package:bargram_technical_manager/utils/string_is_empty.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart';
import '../database/shared_preferences/shared_preferences_manager.dart';
import '../model/dto/service_result/general_service_result.dart';
import '../utils/logger.dart';
import '../utils/server_url.dart';
import '../utils/shared_strings.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;



//Server Interaction for Confirm SMS Code
class CheckListService {


  //////////////////////////////////////////////////////////////////////////////

  static Future getDriver({
    required String nationalCode,
    required String mobileNumber,
  })async{

    //Sending Request
    String token = await SharedPreferencesManager.getAccessToken();
    http.Response response;
    try {
      // response = await http.get(Uri.parse(ServerUrl.allTurns+'?page=$page'),
      response = await http.post(Uri.parse(ServerUrl.getDriver),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: {
            'nationalId':nationalCode,
            'mobile':mobileNumber,
          }
      );
    }
    catch(e){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    //converting response body to json format
    Map result = await JsonHelper.convertResponseToJson(utf8.decode(response.bodyBytes));
    Logger.consolePrint(result);

    //connection errors
    if(stringIsEmpty(result.toString())){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    if(response.statusCode == 200){ // on success
      return GeneralServiceResult(connection:true,showMessage:false,success:true,message:result['message'],tokenExp:false,data:result['data']);
    }

    //token expired
    else if(response.statusCode == 401){
      return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:true);
    }

    else{
      //detect error message that implemented in backend side
      if(result.containsKey('error')){
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:false);
      }
      if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
    }
    return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);

  }


  //////////////////////////////////////////////////////////////////////////////

  static Future registerCheckListCar({
    required String id,
    required String smartCode,
  })async{

    //Sending Request
    String token = await SharedPreferencesManager.getAccessToken();
    http.Response response;
    try {
      // response = await http.get(Uri.parse(ServerUrl.allTurns+'?page=$page'),
      response = await http.post(Uri.parse(ServerUrl.registerCheckListCar),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: {
            'smartIdCar':smartCode,
            'driver_id':id,
          }
      );
    }
    catch(e){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    //converting response body to json format
    Map result = await JsonHelper.convertResponseToJson(utf8.decode(response.bodyBytes));

    //connection errors
    if(stringIsEmpty(result.toString())){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    if(response.statusCode == 200){ // on success
      return GeneralServiceResult(connection:true,showMessage:true,success:true,message:result['message'],tokenExp:false);
    }

    //token expired
    else if(response.statusCode == 401){
      return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:true);
    }

    else{
      //detect error message that implemented in backend side
      if(result.containsKey('error')){
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:false);
      }
      if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
    }
    return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);

  }


  //////////////////////////////////////////////////////////////////////////////

  static Future getTrackingCode({
    required String id,
  })async{

    //Sending Request
    String token = await SharedPreferencesManager.getAccessToken();
    http.Response response;
    try {
      // response = await http.get(Uri.parse(ServerUrl.allTurns+'?page=$page'),
      response = await http.post(Uri.parse(ServerUrl.getTrackingCode),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: {
            'check_list_id':id,
          }
      );
    }
    catch(e){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    //converting response body to json format
    Map result = await JsonHelper.convertResponseToJson(utf8.decode(response.bodyBytes));

    //connection errors
    if(stringIsEmpty(result.toString())){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    if(response.statusCode == 200){ // on success
      return GeneralServiceResult(connection:true,showMessage:true,success:true,message:result['message'],tokenExp:false);
    }

    //token expired
    else if(response.statusCode == 401){
      return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:true);
    }

    else{
      //detect error message that implemented in backend side
      if(result.containsKey('error')){
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:false);
      }
      if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
    }
    return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);

  }

  //////////////////////////////////////////////////////////////////////////////

  static Future changeStatus({
    required String id,
    required String status,
  })async{

    //Sending Request
    String token = await SharedPreferencesManager.getAccessToken();
    http.Response response;
    try {
      // response = await http.get(Uri.parse(ServerUrl.allTurns+'?page=$page'),
      response = await http.post(Uri.parse(ServerUrl.changeCheckListStatus),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
        'check_list_id':id,
        'status':status,
        }
      );
    }
    catch(e){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    //converting response body to json format
    Map result = await JsonHelper.convertResponseToJson(utf8.decode(response.bodyBytes));

    //connection errors
    if(stringIsEmpty(result.toString())){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    if(response.statusCode == 200){ // on success
      return GeneralServiceResult(connection:true,showMessage:false,success:true,message:result['message'],tokenExp:false);
    }

    //token expired
    else if(response.statusCode == 401){
      return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:true);
    }

    else{
      //detect error message that implemented in backend side
      if(result.containsKey('error')){
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:false);
      }
      if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
    }
    return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);

  }

  //////////////////////////////////////////////////////////////////////////////

  static Future getAll()async{

    //Sending Request
    String token = await SharedPreferencesManager.getAccessToken();
    http.Response response;
    try {
      response = await http.get(
        ServerUrl.httpType == 'http' ?
        Uri.http(ServerUrl.host,ServerUrl.checkLists,_paramMakerForGetAllFastLoads()):
        Uri.https(ServerUrl.host,ServerUrl.checkLists,_paramMakerForGetAllFastLoads()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    }
    catch(e){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    //converting response body to json format
    Map result = await JsonHelper.convertResponseToJson(utf8.decode(response.bodyBytes));

    //connection errors
    if(stringIsEmpty(result.toString())){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    if(response.statusCode == 200){ // on success
      return GeneralServiceResult(connection:true,showMessage:false,success:true,message:result['message'],tokenExp:false,data:result['data']['checkLists']['data'],hasMoreData:result['data']['checkLists']['next_page_url']==null?false:true);
    }

    //token expired
    else if(response.statusCode == 401){
      return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:true);
    }

    else{
      //detect error message that implemented in backend side
      if(result.containsKey('error')){
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:false);
      }
      if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
    }
    return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);

  }

  //////////////////////////////////////////////////////////////////////////////

  static Future register({
    required String token,
    required String nationalCode,
    required String carId,
    required String macAddress,
    required Uint8List signatureImage,
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
    required File selfie,
  })async{


    // macAddress = '00:00:00:00:00:00';
    dio.Response? response;
    try {
      dio.FormData formData = dio.FormData.fromMap(
        stringIsEmpty(macAddress)?
        {
          'car_id':carId,
          'nationalId':nationalCode,
          'govahiname_fani_motabar':govahiname_fani_motabar.toString(),
          'salamat_zaheri_ring_lastik':salamat_zaheri_ring_lastik.toString(),
          'hade_aqal_aj_lastik':hade_aqal_aj_lastik.toString(),
          'salamat_sistem_satmayeshi_garmayeshi':salamat_sistem_satmayeshi_garmayeshi.toString(),
          'salamat_barf_pak_kon':salamat_barf_pak_kon.toString(),
          'salamat_shishe_jolo':salamat_shishe_jolo.toString(),
          'jabe_komak_haye_avaliye':jabe_komak_haye_avaliye.toString(),
          'mosalas_shabrang_va_cheraq_cheshmak_zan':mosalas_shabrang_va_cheraq_cheshmak_zan.toString(),
          'cheraq_jolo_aqab_neshanegar_janebi':cheraq_jolo_aqab_neshanegar_janebi.toString(),
          'sheraq_rahnama_boq_ayene':sheraq_rahnama_boq_ayene.toString(),
          'alaem_hoshdar':alaem_hoshdar.toString(),
          'vaziyate_zaheri':vaziyate_zaheri.toString(),
          'hefazhaye_janebi':hefazhaye_janebi.toString(),
          'salamat_kamarband':salamat_kamarband.toString(),
          'tajhizat_etesali_be_keshande':tajhizat_etesali_be_keshande.toString(),
          'salamat_amalkard_tormoz':salamat_amalkard_tormoz.toString(),
          'amade_be_kar_bodan_sanjesh_sorat_zaman':amade_be_kar_bodan_sanjesh_sorat_zaman.toString(),
          'vaziyat_sistem_farman':vaziyat_sistem_farman.toString(),
          'adam_taqir_ajzaye_fani':adam_taqir_ajzaye_fani.toString(),
          'zanjir_charkh_tajhizat_pashesh_gel':zanjir_charkh_tajhizat_pashesh_gel.toString(),
          'salamat_sabet_bodan_mahal_batry':salamat_sabet_bodan_mahal_batry.toString(),
          'vaziyate_makhzan_sokht':vaziyate_makhzan_sokht.toString(),
          'nadashtan_dod':nadashtan_dod.toString(),
          'tatbiq_pelak':tatbiq_pelak.toString(),
          'adam_nasb_tajhizat_qeyr_zaror':adam_nasb_tajhizat_qeyr_zaror.toString(),
          'roayat_mane_moqararat':roayat_mane_moqararat.toString(),
          'mahar_sahih_bar_va_chideman':mahar_sahih_bar_va_chideman.toString(),
          'tarikh_kapsol_atashneshani':tarikh_kapsol_atashneshani.toString(),
          'selfie': dio.MultipartFile.fromBytes(await FlutterImageCompress.compressWithList(selfie.readAsBytesSync(), quality: 50), filename:'signature.png', contentType:MediaType("image", 'png')),
          "emza": dio.MultipartFile.fromBytes(await FlutterImageCompress.compressWithList(signatureImage, quality: 50), filename:'signature.png', contentType:MediaType("image", 'png')),
        }:
        {
          'nationalId':nationalCode,
          'car_id':carId,
          'macAddress':macAddress.toString(),
          'govahiname_fani_motabar':govahiname_fani_motabar.toString(),
          'salamat_zaheri_ring_lastik':salamat_zaheri_ring_lastik.toString(),
          'hade_aqal_aj_lastik':hade_aqal_aj_lastik.toString(),
          'salamat_sistem_satmayeshi_garmayeshi':salamat_sistem_satmayeshi_garmayeshi.toString(),
          'salamat_barf_pak_kon':salamat_barf_pak_kon.toString(),
          'salamat_shishe_jolo':salamat_shishe_jolo.toString(),
          'jabe_komak_haye_avaliye':jabe_komak_haye_avaliye.toString(),
          'mosalas_shabrang_va_cheraq_cheshmak_zan':mosalas_shabrang_va_cheraq_cheshmak_zan.toString(),
          'cheraq_jolo_aqab_neshanegar_janebi':cheraq_jolo_aqab_neshanegar_janebi.toString(),
          'sheraq_rahnama_boq_ayene':sheraq_rahnama_boq_ayene.toString(),
          'alaem_hoshdar':alaem_hoshdar.toString(),
          'vaziyate_zaheri':vaziyate_zaheri.toString(),
          'hefazhaye_janebi':hefazhaye_janebi.toString(),
          'salamat_kamarband':salamat_kamarband.toString(),
          'tajhizat_etesali_be_keshande':tajhizat_etesali_be_keshande.toString(),
          'salamat_amalkard_tormoz':salamat_amalkard_tormoz.toString(),
          'amade_be_kar_bodan_sanjesh_sorat_zaman':amade_be_kar_bodan_sanjesh_sorat_zaman.toString(),
          'vaziyat_sistem_farman':vaziyat_sistem_farman.toString(),
          'adam_taqir_ajzaye_fani':adam_taqir_ajzaye_fani.toString(),
          'zanjir_charkh_tajhizat_pashesh_gel':zanjir_charkh_tajhizat_pashesh_gel.toString(),
          'salamat_sabet_bodan_mahal_batry':salamat_sabet_bodan_mahal_batry.toString(),
          'vaziyate_makhzan_sokht':vaziyate_makhzan_sokht.toString(),
          'nadashtan_dod':nadashtan_dod.toString(),
          'tatbiq_pelak':tatbiq_pelak.toString(),
          'adam_nasb_tajhizat_qeyr_zaror':adam_nasb_tajhizat_qeyr_zaror.toString(),
          'roayat_mane_moqararat':roayat_mane_moqararat.toString(),
          'mahar_sahih_bar_va_chideman':mahar_sahih_bar_va_chideman.toString(),
          'tarikh_kapsol_atashneshani':tarikh_kapsol_atashneshani.toString(),
          'selfie': dio.MultipartFile.fromBytes(await FlutterImageCompress.compressWithList(selfie.readAsBytesSync(), quality: 50), filename:'signature.png', contentType:MediaType("image", 'png')),
          "emza": dio.MultipartFile.fromBytes(await FlutterImageCompress.compressWithList(signatureImage, quality: 50), filename:'signature.png', contentType:MediaType("image", 'png')),
        }
      );

      response = await dio.Dio().post(
          ServerUrl.registerCheckList,
          data: formData,
          options:dio.Options(headers:{
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          })
      );
    }
    on dio.DioException catch(err){
      if(err.response?.data.containsKey('error')){
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:err.response?.data['error'],tokenExp:false);
      }
      else if(err.response?.data.containsKey('errors')){
        List errors = [];
        err.response?.data['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    Map result = await JsonHelper.convertResponseToJson(response.data);
    //converting response body to json format

    //connection errors
    if(stringIsEmpty(result.toString())){
      return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    if(response!.statusCode == 200){ // on success
      return GeneralServiceResult(connection:true,showMessage:false,success:true,message:result['message'],tokenExp:false,);
    }

    //token expired
    else if(response!.statusCode == 401){
      return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:true);
    }

    else{
      //detect error message that implemented in backend side
      if(result.containsKey('error')){
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:false);
      }
      else if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
    }
    return GeneralServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);

  }

  //////////////////////////////////////////////////////////////////////////////

}

// param maker for get all fast loads Method
Map<String,dynamic> _paramMakerForGetAllFastLoads(){

  Map<String,dynamic> params = <String,dynamic>{};
  params['page'] = RegisteredCheckListModel().paginateIndex.toString();

  if(!stringIsEmpty(RegisteredCheckListModel().nationalCodeFilterController.text)){
    params['driver_national_id'] = RegisteredCheckListModel().nationalCodeFilterController.text;
  }
  if(!stringIsEmpty(RegisteredCheckListModel().mobileNumberFilterController.text)){
    params['driver_mobile'] = RegisteredCheckListModel().mobileNumberFilterController.text;
  }
  if(RegisteredCheckListModel().selectedStatusFilter != null){
    params['status'] = RegisteredCheckListModel().selectedStatusFilter!.value;
  }
  if(!stringIsEmpty(RegisteredCheckListModel().startDateFilterController.text)){
    params['from_date'] = RegisteredCheckListModel().startDateFilterController.text;
  }
  if(!stringIsEmpty(RegisteredCheckListModel().endDateFilterController.text)){
    params['to_date'] = RegisteredCheckListModel().endDateFilterController.text;
  }
  return params;
}