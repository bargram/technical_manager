import 'dart:convert';
import 'package:bargram_technical_manager/model/dto/service_result/general_service_result.dart';
import 'package:bargram_technical_manager/utils/json_helper.dart';
import 'package:bargram_technical_manager/utils/logger.dart';
import 'package:bargram_technical_manager/utils/string_is_empty.dart';
import 'package:http/http.dart' as http;

import '../model/dto/service_result/confirm_sms_code_service_result.dart';
import '../utils/server_url.dart';
import '../utils/shared_strings.dart';

//Server Interaction for Confirm SMS Code
class ConfirmSMSCodeService {

  static Future confirm({
    required String phoneNumber,
    required String otpCode,
    required String password,
    required String firebaseToken,
  })async{


    //Sending Request
    http.Response response;
    try {
      response = await http.post(Uri.parse(ServerUrl.confirmSMS),
          headers: {
            'Accept': 'application/json'
          },
          body: stringIsEmpty(password.toString()) ? // if password is not set
          {
            'mobile': phoneNumber,
            'otp':    otpCode.toString(),
            'token':firebaseToken
          }:
          {// if password is set
            'mobile': phoneNumber,
            'otp':    otpCode,
            'password':password.toString(),
            'token':firebaseToken
          }
      );
    }
    catch(e){
      print(e);
      return ConfirmSMSCodeServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    //converting response body to json format
    Map result = await JsonHelper.convertResponseToJson(utf8.decode(response.bodyBytes));

    //connection errors
    if(stringIsEmpty(result.toString())){
      return ConfirmSMSCodeServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,tokenExp:false);
    }

    if(response.statusCode == 200){ // on success
      return ConfirmSMSCodeServiceResult(connection:true,showMessage:false,success:true,message:result['message'],token:result['data']['access_token'],tokenExp:false,
          userInfo: result['data']['user'],
      );
    }

    //token expired
    else if(response.statusCode == 401){
      return ConfirmSMSCodeServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:true);
    }

    else{
      //detect error message that implemented in backend side
      if(result.containsKey('error')){
        return ConfirmSMSCodeServiceResult(connection:true,showMessage:true,success:false,message:result['error'],tokenExp:false);
      }
      else if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return ConfirmSMSCodeServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  static Future forgotPassword({
    required String phoneNumber,
    required String otpCode,
    required String password,
  })async{

    //Sending Request
    http.Response response;
    try {
      response = await http.post(Uri.parse(ServerUrl.forgotPassword),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'mobile': phoneNumber,
            'otp':    otpCode,
            'password':password,
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
      return GeneralServiceResult(connection:true,showMessage:false,success:true,message:result['message'],tokenExp:false,);
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
      else if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return GeneralServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],tokenExp:false);
      }
    }
  }

}
