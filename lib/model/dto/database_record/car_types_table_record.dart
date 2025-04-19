
import 'package:flutter/foundation.dart';

//Car Types Table Record Data Object
class CarTypesTableRecord {

  String id;
  String title;
  String maxWeight;
  String minWeight;

  CarTypesTableRecord({
    required this.id,
    required this.title,
    required this.maxWeight,
    required this.minWeight,
  });

  static CarTypesTableRecord fromMap(Map json){
    return CarTypesTableRecord(
      id: json['id'],
      title: json['title'],
      maxWeight: json['max_weight'],
      minWeight: json['min_weight'],
    );
  }
  static Map<String,dynamic> toMap(CarTypesTableRecord record){
    return {
      'id':record.id,
      'title':record.title,
      'max_weight':record.maxWeight,
      'min_weight':record.minWeight,
    };
  }

}