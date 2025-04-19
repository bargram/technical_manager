import 'dart:convert';
import '../model/dto/service_result/login_service_result.dart';
import '../utils/json_helper.dart';
import '../utils/logger.dart';
import '../utils/server_url.dart';
import '../utils/shared_strings.dart';
import '../utils/string_is_empty.dart';
import 'package:http/http.dart' as http;




////Server Interaction for Login
class LoginService {

  static Future login({
    required String phoneNumber,
    required bool isSignup,
  })async{

    //Sending Request
    http.Response response;
    try {
      response = await http.post(Uri.parse(ServerUrl.login),
          headers: {
            'Accept': 'application/json'
          },
          body: isSignup ?
          {
            'mobile':     phoneNumber,
            'type':     'REGISTER',
          }:
          {
            'mobile':     phoneNumber,
            'type':     'LOGIN',
          }
      );
    }
    catch(e){
      // print(e);
      return LoginServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,redirectPageName:null);
    }

    //converting response body to json format
    Map result = await JsonHelper.convertResponseToJson(utf8.decode(response.bodyBytes));

    //connection errors
    if(stringIsEmpty(result.toString())){
      return LoginServiceResult(connection:false,showMessage:true,success:false,message:SharedStrings.serverConnectionError,redirectPageName:null);
    }

    if(response.statusCode == 200){ // on success
      return LoginServiceResult(connection:true,showMessage:false,success:true, twoFactorEnabled:result['data']['twoFactorEnabled'].toString() == '1'?true:false,redirectPageName:null,message:result['message']);
    }

    // redirecting to other page
    else if (response.statusCode == 402){
      return LoginServiceResult(connection:true,showMessage:true,success:true,redirectPageName:result['data']['redirect'],message:result['error']);
    }

    else{
      //detect error message that implemented in backend side
      if(result.containsKey('error')){
        return LoginServiceResult(connection:true,showMessage:true,success:false,message:result['error'],redirectPageName:null);
      }
      else if(result.containsKey('errors')){
        List errors = [];
        result['errors'].forEach((key, value) {
          errors.add(value!);
        });
        return LoginServiceResult(connection:true,showMessage:true,success:false,message:errors[0][0],redirectPageName:null);
      }
    }
  }


}