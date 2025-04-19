
import 'package:flutter/foundation.dart';

//Reserved Loads Table Record Data Object
class ReservedLoadsTableRecord {

  String loadId;
  String reserveId;

  ReservedLoadsTableRecord({
    required this.loadId,
    required this.reserveId,
  });

  static ReservedLoadsTableRecord fromMap(Map json){
    return ReservedLoadsTableRecord(
      loadId: json['load_id'],
      reserveId: json['reserve_id'],
    );
  }
  static Map<String,dynamic> toMap(ReservedLoadsTableRecord record){
    return {
      'load_id':record.loadId,
      'reserve_id':record.reserveId,
    };
  }

}