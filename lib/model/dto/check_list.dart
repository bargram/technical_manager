



import 'check_list_car.dart';
import 'enum/check_list_status.dart';

class CheckList {


  String id;
  String technicalLicenseDate;
  String capsuleDate;
  String signatureUrl;
  String createdDate;
  String createdTime;
  String ip;
  CheckListCar? car;
  String? driverName;
  String? trackingCode;
  CheckListStatus status;

  CheckList({
    required this.id,
    required this.technicalLicenseDate,
    required this.capsuleDate,
    required this.signatureUrl,
    required this.ip,
    required this.driverName,
    required this.trackingCode,
    required this.car,
    required this.status,
    required this.createdDate,
    required this.createdTime
  });



}