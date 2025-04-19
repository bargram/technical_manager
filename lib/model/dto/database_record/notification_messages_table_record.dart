
import 'package:flutter/foundation.dart';

//Notification Messages Table Record Data Object
class NotificationMessagesTableRecord {

  String title;
  String body;
  String date;

  NotificationMessagesTableRecord({
    required this.title,
    required this.body,
    required this.date,
  });

  static NotificationMessagesTableRecord fromMap(Map json){
    return NotificationMessagesTableRecord(
        title: json['title'],
        body: json['body'],
        date: json['date']
    );
  }
  static Map<String,dynamic> toMap(NotificationMessagesTableRecord record){
    return {
      'title':record.title,
      'body':record.body,
      'date':record.date,
    };
  }

}