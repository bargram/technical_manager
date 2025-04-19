import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dto/user_info.dart';



class UserModel extends GetxController{

  //using for detecting user info of user that logged in
  static UserInfo? _userInfo;
  UserInfo? get userInfo => _userInfo;
  set userInfo(value){
    _userInfo = value;
  }
  static setUserInfo(UserInfo userInfo){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<UserModel>().userInfo = userInfo:
    _userInfo = userInfo;
  }

  //using for saving picked profile image data
  static Uint8List? _profileImage;
  Uint8List? get profileImage => _profileImage;
  set profileImage(value){
    _profileImage = value;
    update();
  }
  static setProfileImage(Uint8List? value){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<UserModel>().profileImage = value:
    _profileImage = value;
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
    changeNotifier = false;
    super.onClose();
  }
  //////////////////////////////////////////////////////////////////////////////

}