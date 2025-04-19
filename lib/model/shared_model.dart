import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';



class SharedModel extends GetxController{

  static BuildContext? _context;
  BuildContext? get context => _context;
  set context(value){
    _context = value;
  }
  static setContext(BuildContext? context){
    _context = context;
  }

  static bool? _hasTodayCheckList;
  bool? get hasTodayCheckList => _hasTodayCheckList;
  set hasTodayCheckList(value){
    _hasTodayCheckList = value;
  }
  static setHasTodayCheckList(bool? value){
    _hasTodayCheckList = value;
  }


  static bool _isAppPaused = false;
  bool get isAppPaused => _isAppPaused;
  set isAppPaused(value){
    _isAppPaused = value;
  }
  static setIsAppPaused(value){
    _isAppPaused = value;
  }

  static String _currentAppVersion = '';
  String get currentAppVersion => _currentAppVersion;
  set currentAppVersion(value){
    _currentAppVersion = value;
  }
  static setCurrentAppVersion(String value){
    _currentAppVersion = value;
  }

  static String _deepLinkFastLoadId = '';
  String get deepLinkFastLoadId => _deepLinkFastLoadId;
  set deepLinkFastLoadId(value){
    _deepLinkFastLoadId = value;
  }
  static setDeepLinkFastLoadId(String value){
    _deepLinkFastLoadId = value;
  }


  //using for detecting app need force update or not
  static bool _appLockedForUpdate = false;
  bool get appLockedForUpdate => _appLockedForUpdate;
  set appLockedForUpdate(value){
    _appLockedForUpdate = value;
  }
  static setForceUpdate(value){
    _appLockedForUpdate = value;
  }


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