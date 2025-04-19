
import 'package:flutter/foundation.dart';

//Last Sending SMS Code Time Data Object
class LastSendingSMSCodeTime{
  String phoneNumber;
  String dateTime;

  LastSendingSMSCodeTime({required this.phoneNumber, required this.dateTime});

  static LastSendingSMSCodeTime fromMap(Map json){
    return LastSendingSMSCodeTime(
      phoneNumber: json['phone_number'],
      dateTime:    json['date_time']
    );
  }
  static Map toMap(LastSendingSMSCodeTime object){
    return{
      'phone_number': object.phoneNumber,
      'date_time'   : object.dateTime
    };
  }
}