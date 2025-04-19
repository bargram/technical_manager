
import 'package:flutter/foundation.dart';

//Car Data Object
class UserInfo{

  String name;
  // String profileImagePath;
  String phoneNumber;


  UserInfo({
    required this.name,
    // required this.profileImagePath,
    required this.phoneNumber,
  });

  static Map toMap(UserInfo userInfo){
    return {
      'name':userInfo.name,
      // 'profile_image_path':userInfo.profileImagePath,
      'phone_number':userInfo.phoneNumber,
    };
  }

  static UserInfo fromMap(Map json){
    return
      UserInfo(
        name: json['name'],
        // profileImagePath: json['profile_image_path'],
        phoneNumber: json['phone_number'],
      );
  }
}