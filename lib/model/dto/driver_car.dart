
import 'package:flutter/foundation.dart';

//Car Data Object
class DriverCar{
  String id;
  String? carTypeTitle;
  String smartCode;
  String plaque;
  String technicalDiagnosisDate;
  bool rahdariStatus;
  bool defaultStatus;
  bool selected;

  DriverCar({
    required this.id,
    required this.carTypeTitle,
    required this.smartCode,
    required this.plaque,
    required this.technicalDiagnosisDate,
    required this.rahdariStatus,
    required this.defaultStatus,
    required this.selected,
  });

}