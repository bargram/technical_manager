
import 'package:flutter/foundation.dart';

//Routing Table Record Data Object
class RoutingTableRecord {

  String id;
  String lat;
  String lng;

  RoutingTableRecord({
    required this.id,
    required this.lat,
    required this.lng,
  });

  static RoutingTableRecord fromMap(Map json){
    return RoutingTableRecord(
        id: json['id'],
        lat: json['lat'],
        lng: json['lng'],
    );
  }
  static Map<String,dynamic> toMap(RoutingTableRecord record){
    return {
      'id':record.id,
      'lat':record.lat,
      'lng':record.lng,
    };
  }

}