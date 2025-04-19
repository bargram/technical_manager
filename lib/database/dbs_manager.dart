import 'package:bargram_technical_manager/database/shared_preferences/shared_preferences_manager.dart';
import 'package:bargram_technical_manager/database/sqlite/notification_messages_table.dart';

//Managing all local databases
class DBsManager {

  static Future deleteDBsData()async{
    try{
      await SharedPreferencesManager.deleteAccessToken();
      await SharedPreferencesManager.deleteUserInfo();
      await SharedPreferencesManager.setNotificationMessagesReadingStatus(true);
      await NotificationMessagesTable.deleteAllMessages();
      await SharedPreferencesManager.setIsLoggedIn(false);
      await SharedPreferencesManager.setProfileImage(null);
    }catch(err){
      // alert(context:context, title:'', message:err.toString());
    }
  }

}

