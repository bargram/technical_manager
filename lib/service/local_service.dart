import 'dart:async';
import 'package:flutter/material.dart';
import '../database/shared_preferences/shared_preferences_manager.dart';
import '../model/notification_messages_model.dart';
import '../model/shared_model.dart';
import '../model/user_model.dart';
import '../utils/assets_paths.dart';
import '../utils/load_background_image.dart';
import 'package:package_info_plus/package_info_plus.dart';



class LocalService {

  static Future<void> runMultipleServices()async{
    await loadUserInfo();
    await loadNotificationMessagesStatus();
    // await loadImagesBeforeStartingApp();
    await loadAppInfo();
  }

  // load user info to model
  static Future<void> loadUserInfo()async{
    await UserModel.setUserInfo(await SharedPreferencesManager.getUserInfo());
    await UserModel.setProfileImage(await SharedPreferencesManager.getProfileImage());
    // SharedModel.setSurveyInfo(null);
  }

  static Future<void> loadAppInfo()async{
    SharedModel.setCurrentAppVersion((await PackageInfo.fromPlatform()).version ?? '1.0.0');
    // await SharedPreferencesManager.setForceUpdate(false);
    SharedModel.setForceUpdate(await SharedPreferencesManager.getForceUpdate());
  }

    // load notification messages status to model
  static Future<void> loadNotificationMessagesStatus()async{
    if((await SharedPreferencesManager.getNotificationMessagesReadingStatus()) == false){
      NotificationMessagesModel.setMessagesAsUnread();
    }
    else{
      NotificationMessagesModel.setMessagesAsRead();
    }
  }


  static Future<void> loadImagesBeforeStartingApp()async{
    await loadImageBeforeRendering(AssetImage(AssetPaths.appLogo)); // load logo before rendering due it's take a while for loading
    await loadImageBeforeRendering(AssetImage(AssetPaths.noSignal)); // load logo before rendering due it's take a while for loading
    await loadImageBeforeRendering(AssetImage(AssetPaths.questionIcon)); // load logo before rendering due it's take a while for loading
  }

}