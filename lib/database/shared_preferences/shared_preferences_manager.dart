import 'dart:convert';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/dto/user_info.dart';





//SharedPreferences as one of local dbs
class SharedPreferencesManager {

  ///////////////////////////////Access Token////////////////////////////////////
  static Future<void> setAccessToken(String value)async{
    await (await SharedPreferences.getInstance()).setString('access_token_key',value!);
  }
  static Future<String> getAccessToken()async{
    return (await SharedPreferences.getInstance()).getString('access_token_key').toString();
  }
  static Future<void> deleteAccessToken()async{
    await (await SharedPreferences.getInstance()).setString('access_token_key','');
  }
  //////////////////////////////////////////////////////////////////////////////


  ///////////////////////////////Sending Firebase Token Status////////////////////////////////////
  static Future<void> setIsFirebaseTokenSent(value)async{
    await (await SharedPreferences.getInstance()).setBool('is_firebase_token_sent_key',value!);
  }
  static Future<bool> getIsFirebaseTokenSent()async{
    return (await SharedPreferences.getInstance()).getBool('is_firebase_token_sent_key') ?? false;
  }
  //////////////////////////////////////////////////////////////////////////////


  ///////////////////////////////Logged in State////////////////////////////////////
  static Future<void> setIsLoggedIn(value)async{
    await (await SharedPreferences.getInstance()).setBool('is_logged_in_key',value!);
  }
  static Future<bool> getIsLoggedIn()async{
    return (await SharedPreferences.getInstance()).getBool('is_logged_in_key') ?? false;
  }
  //////////////////////////////////////////////////////////////////////////////


  ///////////////////////////////Force Update State/////////////////////////////
  static Future<void> setProfileImage(Uint8List? data)async{
    await (await SharedPreferences.getInstance()).setString('profile_image_key', jsonEncode({'data':data}));
  }
  static Future<Uint8List?> getProfileImage()async{
    var storedData = (await SharedPreferences.getInstance()).getString('profile_image_key');
    if(storedData == null || await jsonDecode(storedData)['data'] == null) return null;
    return Uint8List.fromList(await jsonDecode(storedData)['data'].cast<int>().toList());
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////Location Permission////////////////////////////////////
  static Future<void> setLocationPermission(value)async{
    await (await SharedPreferences.getInstance()).setBool('location_permission_key',value!);
  }
  static Future<bool> getLocationPermission()async{
    return (await SharedPreferences.getInstance()).getBool('location_permission_key') ?? false;
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////Force Update State////////////////////////////////////
  static Future<void> setForceUpdate(value)async{
    await (await SharedPreferences.getInstance()).setBool('force_update_key',value!);
  }
  static Future<bool> getForceUpdate()async{
    return (await SharedPreferences.getInstance()).getBool('force_update_key') ?? false;
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////Sending SMS Code Time/////////////////////////////
  static Future<void> setLastSendingSMSCodeTime(String value)async{
    await (await SharedPreferences.getInstance()).setString('sending_sms_code_time_key',value!);
  }
  static Future<String> getLastSendingSMSCodeTime()async{
    return (await SharedPreferences.getInstance()).getString('sending_sms_code_time_key').toString();
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////origin cities/////////////////////////////
  static Future<void> setOriginCities(List<String> value)async{
    await (await SharedPreferences.getInstance()).setStringList('origin_cities_key', value);
  }
  static Future<List<String>> getOriginCities()async{
    return (await SharedPreferences.getInstance()).getStringList('origin_cities_key')??<String>[];
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////Notification Messages Reading Status/////////////////////////////
  static Future<void> setNotificationMessagesReadingStatus(value)async{
    await (await SharedPreferences.getInstance()).setBool('notification_messages_reading_status',value!);
  }
  static Future<bool> getNotificationMessagesReadingStatus()async{
    return (await SharedPreferences.getInstance()).getBool('notification_messages_reading_status')?? false;
  }
  //////////////////////////////////////////////////////////////////////////////


  ///////////////////////////////Having Loading Remittance Status/////////////////////////////
  static Future<void> setHavingLoadingRemittance(value)async{
    await (await SharedPreferences.getInstance()).setBool('having_loading_remittance_key',value!);
  }
  static Future<bool> getHavingLoadingRemittance()async{
    return ((await SharedPreferences.getInstance()).getBool('having_loading_remittance_key')) ?? false;
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////Having Loading Remittance Status/////////////////////////////
  static Future<void> setHavingDischargeRemittance(value)async{
    await (await SharedPreferences.getInstance()).setBool('having_discharge_remittance_key',value!);
  }
  static Future<bool> getHavingDischargeRemittance()async{
    return ((await SharedPreferences.getInstance()).getBool('having_discharge_remittance_key')) ?? false;
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////Having Loading Remittance Status/////////////////////////////
  static Future<void> setIsInVoiceChannel(value)async{
    await (await SharedPreferences.getInstance()).setBool('is_in_voice_channel_key',value!);
  }
  static Future<bool> getIsInVoiceChannel()async{
    return ((await SharedPreferences.getInstance()).getBool('is_in_voice_channel_key')) ?? false;
  }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////Having Loading Remittance Status/////////////////////////////
  // static Future<void> setLastCheckListDate(value)async{
  //   await (await SharedPreferences.getInstance()).setString('last_check_list_date_key',value!);
  // }
  // static Future<String?> getLastCheckListDate()async{
  //   return (await SharedPreferences.getInstance()).getString('last_check_list_date_key');
  // }
  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////User Info/////////////////////////////
  static Future<void> setUserInfo(UserInfo userInfo)async{
    await (await SharedPreferences.getInstance()).setString('user_info_key',jsonEncode(UserInfo.toMap(userInfo)));
  }
  static Future<UserInfo> getUserInfo()async{
    String info = (await SharedPreferences.getInstance()).getString('user_info_key').toString();
    if(info != 'null') {
      return UserInfo.fromMap(jsonDecode(info));
    }
    // returning as null values
    return UserInfo(name:'',phoneNumber:'');
  }
  static Future deleteUserInfo()async{
    await (await SharedPreferences.getInstance()).setString('user_info_key', jsonEncode(UserInfo.toMap(UserInfo(name:'', phoneNumber:''))));
  }
  //////////////////////////////////////////////////////////////////////////////


}