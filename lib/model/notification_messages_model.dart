


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../database/shared_preferences/shared_preferences_manager.dart';
import '../database/sqlite/notification_messages_table.dart';
import 'dto/database_record/notification_messages_table_record.dart';

class NotificationMessagesModel extends GetxController{

  //using for showing notification messages list
  static List<NotificationMessagesTableRecord> _notificationMessages = <NotificationMessagesTableRecord>[];
  List<NotificationMessagesTableRecord> get notificationMessages => _notificationMessages;
  set notificationMessages(value){
    _notificationMessages = value;
    update();
  }
  static setNotificationMessages(List<NotificationMessagesTableRecord> list){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<NotificationMessagesModel>().notificationMessages = List.of(list):
    _notificationMessages = List.of(list);
  }


  //using for detecting reading notification messages status
  static bool _messagesReadedStatus = true;
  bool get messagesReadingStatus => _messagesReadedStatus;
  set messagesReadingStatus(value){
    _messagesReadedStatus = value;
    update();
  }
  static Future setMessagesAsUnread()async{
    if(_isNotificationMessagesPageOpened == true) return; // when page opened we doesn't need this method
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<NotificationMessagesModel>().messagesReadingStatus = false:
    _messagesReadedStatus = false;
    await SharedPreferencesManager.setNotificationMessagesReadingStatus(false);
  }
  static Future setMessagesAsRead()async{
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<NotificationMessagesModel>().messagesReadingStatus = true:
    _messagesReadedStatus = true;
    SharedPreferencesManager.setNotificationMessagesReadingStatus(true);
  }


  //using for detecting current page that after this we setting messagesReadingStatus
  static bool _isNotificationMessagesPageOpened = false;
  bool get isNotificationMessagesPageOpened => _isNotificationMessagesPageOpened;
  set isNotificationMessagesPageOpened(value){
    _isNotificationMessagesPageOpened = value;
  }
  static setIsNotificationMessagesPageOpened(value){
    _isNotificationMessagesPageOpened = value;
  }

  //using for when notification message received
  static addNotification(RemoteMessage message){
    NotificationMessagesTable.insertMessage(//insert to local DB
        title: message.notification!.title,
        body: message.notification!.body,
        date: DateTime.now().toString()
    );
    setMessagesAsUnread();
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