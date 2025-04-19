
import 'package:flutter/foundation.dart';

//Location Table Record Data Object
class LocationTableRecord {

  String lat;
  String lng;
  String date;
  String speed;

  LocationTableRecord({
    required this.lat,
    required this.lng,
    required this.date,
    required this.speed,
  });

  static LocationTableRecord fromMap(Map json){
    return LocationTableRecord(
        lat: json['lat'],
        lng: json['lng'],
        date: json['date'],
      speed: json['speed'],
    );
  }
  static Map<String,dynamic> toMap(LocationTableRecord record){
    return {
      'lat':record.lat,
      'lng':record.lng,
      'date':record.date,
      'speed':record.speed,
    };
  }

}