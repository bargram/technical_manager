import 'package:flutter/material.dart';
import 'package:get/get.dart';



class MainPageModel extends GetxController{

  // using for saving app context
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // // using for changing form type
  // static MainPageCurrentPageType _pageType = MainPageCurrentPageType.home;
  // MainPageCurrentPageType get pageType => _pageType;
  // set pageType(MainPageCurrentPageType value){
  //   _pageType = value;
  //   update();
  // }
  //
  // //using for changing page
  // static void changePage(MainPageCurrentPageType type){
  //   //if class is in real time state then we use GetX for setting value else we setting value normally
  //   changeNotifier ?
  //   Get.find<MainPageModel>().pageType = type:
  //   _pageType = type;
  // }

  //////////////////////////////////////////////////////////////////////////////

  ///////////////////////////Life Cycle Class Managing//////////////////////////
  static bool changeNotifier = false;
  @override
  void onInit() {
    super.onInit();
    changeNotifier = true;
  }
  @override
  void onClose() {
    super.onClose();
    changeNotifier = false;
  }
//////////////////////////////////////////////////////////////////////////////

}