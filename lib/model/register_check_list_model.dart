import 'dart:io';
import 'dart:typed_data';
import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'dto/driver_car.dart';
import 'dto/enum/get_driver_step.dart';
import 'dto/enum/register_check_list_step_type.dart';
import 'dto/register_check_list_item.dart';




class RegisterCheckListModel extends GetxController{


  static TextEditingController driverNationalCodeController = TextEditingController();
  static TextEditingController driverMobileNumberController = TextEditingController();
  static TextEditingController smartCodeController = TextEditingController();


  static String? _driverName;
  String? get driverName => _driverName;
  set driverName(value){
    _driverName = value;
    update();
  }
  static setDriverName(String? name){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisterCheckListModel>().driverName = name:
    _driverName = name;
  }

  static String? _driverId;
  String? get driverId => _driverId;
  set driverId(value){
    _driverId = value;
    update();
  }
  static setDriverId(String? name){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisterCheckListModel>().driverId = name:
    _driverId = name;
  }

  static GetDriverStep _getDriverStep = GetDriverStep.nationalCode;
  GetDriverStep get getDriverStep => _getDriverStep;
  set getDriverStep(value){
    _getDriverStep = value;
    update();
  }
  static setGetDriverStep(GetDriverStep step){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisterCheckListModel>().getDriverStep = step:
    _getDriverStep = step;
  }

  static List<DriverCar> _cars = <DriverCar>[];
  List<DriverCar> get cars => _cars;
  set cars(value){
    _cars = value;
    update();
  }
  static setCars(List<DriverCar> cars){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisterCheckListModel>().cars = cars:
    _cars = cars;
  }

  static DriverCar? _selectedCar;
  DriverCar? get selectedCar => _selectedCar;
  set selectedCar(DriverCar? car){
    _selectedCar = car;
    update();
  }
  static setSelectedCar(DriverCar? car){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisterCheckListModel>().selectedCar = car:
    _selectedCar = car;
  }


  static ScrollController scrollController = ScrollController();
  static ScreenshotController screenshotController = ScreenshotController();
  static PainterController signaturePainterController = PainterController()..setPenType(PenType.pencil)
    ..setStrokeColor(Colors.black)
    ..setMinStrokeWidth(1)
    ..setMaxStrokeWidth(2)
    ..setBlurSigma(0.0);

  static TextEditingController endOfTechnicalDiagnosisController = TextEditingController();
  static DateTime? _endOfTechnicalDiagnosis;
  DateTime? get endOfTechnicalDiagnosis => _endOfTechnicalDiagnosis;
  set endOfTechnicalDiagnosis(value){
    _endOfTechnicalDiagnosis = value;
  }
  static setEndOfTechnicalDiagnosis(DateTime? value){
    _endOfTechnicalDiagnosis = value;
  }

  static TextEditingController endOFireExtinguisherValidationDateController = TextEditingController();
  static DateTime? _endOFireExtinguisherValidation;
  DateTime? get endOFireExtinguisherValidation => _endOFireExtinguisherValidation;
  set endOFireExtinguisherValidation(value){
    _endOFireExtinguisherValidation = value;
  }
  static setEndOFireExtinguisherValidation(DateTime? value){
    _endOFireExtinguisherValidation = value;
  }

  static RegisterCheckListStepType _currentStep = RegisterCheckListStepType.issuanceStep;
  RegisterCheckListStepType get currentStep => _currentStep;
  set currentStep(RegisterCheckListStepType value){
    _currentStep = value;
    update();
  }
  //using for changing page
  static void setCurrentStep(RegisterCheckListStepType step){
    scrollController.jumpTo(0);
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisterCheckListModel>().currentStep = step:
    _currentStep = step;
  }

  static Uint8List? _signatureData;
  Uint8List? get signatureData => _signatureData;
  set signatureData(Uint8List? value){
    _signatureData = value;
    update();
  }
  //using for changing page
  static void setSignatureData(Uint8List? value){
    _signatureData = value;
  }
    static File? _sellfieImage;
  File? get sellfieImage => _sellfieImage;
  set sellfieImage(value) {
    _sellfieImage = value;
    update();
  }

  static setSellfieImage(File? value) {
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier
        ? Get.find<RegisterCheckListModel>().sellfieImage = value
        : _sellfieImage = value;
  }
  static List<RegisterCheckListItem> _items = <RegisterCheckListItem>[
    RegisterCheckListItem(title:'1- گواهی معاینه فنی معتبر'),
    RegisterCheckListItem(title:'2- سلامت ظاهری رینگ ها و لاستیک ها'),
    RegisterCheckListItem(title:'3- حداقل آج جلو 3.2 و عقب 1.6 میلیمتر'),
    RegisterCheckListItem(title:'4- سیستم سرمایش و گرمایش با توجه به وضعیت آب و هوایی فصل'),
    RegisterCheckListItem(title:'5- سلامت برف پاک کن'),
    RegisterCheckListItem(title:'6- سلامت شیشه جلو'),
    RegisterCheckListItem(title:'7- جعبه کمک های اولیه'),
    RegisterCheckListItem(title:'8- مثلث شبرنگ  و چراغ چشمک زن'),
    RegisterCheckListItem(title:'9- چراغ های جلو و عقب نشانگر های جانبی'),
    RegisterCheckListItem(title:'10- چراغ های راهنما - بوق - آینه ها'),
    RegisterCheckListItem(title:'11- علائم هشدار دهنده', metaText:'مارکرها، شبرنگ نمایان سازی ابعاد وسیله نقلیه و بدک'),
    RegisterCheckListItem(title:'12- وضعیت ظاهری', metaText:'عدم پوسیدگی و استفاده از سیسنم روشنایی غیر استاندارد'),
    RegisterCheckListItem(title:'13- حفاظ های جانبی جلو', metaText:'جلو، عقب، کشنده، یدک'),
    RegisterCheckListItem(title:'14- سلامت کمربند ایمنی استاندارد'),
    RegisterCheckListItem(title:'15- تجهیزات اتصالی به کشنده'),
    RegisterCheckListItem(title:'16- سلامت عملکرد ترمز های پایی و دستی'),
    RegisterCheckListItem(title:'17- آماده به کار بودن سنجش سرعت و زمان'),
    RegisterCheckListItem(title:'18- سیستم سلامت فرمان از نظر عملکرد'),
    RegisterCheckListItem(title:'19-عدم تغییر در اجزای فنی وسیله نقلیه'),
    RegisterCheckListItem(title:'20- زنجیر چرخ در مواقع لزوم و تجهیزات ممانعت از پاشش گل'),
    RegisterCheckListItem(title:'21- سلامت و ثابت بودن محل استقرار باطری ها'),
    RegisterCheckListItem(title:'22- وضعیت مخزن سوخت وسیله نقلیه'),
    RegisterCheckListItem(title:'23- نداشتن غلظت دود', metaText:'حجم بالای کدری، دود رنگی'),
    RegisterCheckListItem(title:'24- تطبیق پلاک وسیله نقلیه'),
    RegisterCheckListItem(title:'25- عدم نصب تجهیزات غیر ضرور که مانع دید راننده در مسیر رانندگی می شود'),
    RegisterCheckListItem(title:'26- رعایت منع مقررات تغییر وضعیت وسیله نقلیه'),
    RegisterCheckListItem(title:'27- مهار صحیح بار و چیدمان محموله'),
    RegisterCheckListItem(title:'28- کپسول آتش نشانی آماده به کار متناسب با نوع وسیله نقلیه'),
  ];
  List<RegisterCheckListItem> get items => _items;
  set items(value){
    _items = value;
    update();
  }
  static setItemsList(List<RegisterCheckListItem> list){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisterCheckListModel>().items = List.of(list):
    _items = List.of(list);
  }
  static updateItem(RegisterCheckListItem item, bool status){
    for(var _item in _items){
      if(_item.title == item.title){
        _item.approveStatus = status;
      }
    }
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisterCheckListModel>().items = List.of(_items):null;
  }

  static reset(){
    _getDriverStep = GetDriverStep.nationalCode;
    driverNationalCodeController.text = '';
    driverMobileNumberController.text = '';
    smartCodeController.text = '';
    _driverName = null;
    _cars = <DriverCar>[];
    _selectedCar = null;
    for(int i=0; i<_items.length;i++){
      _items[i].approveStatus = null;
    }
    _getDriverStep = GetDriverStep.nationalCode;
    _currentStep = RegisterCheckListStepType.issuanceStep;
  }
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
    reset();
    super.onClose();
  }
  //////////////////////////////////////////////////////////////////////////////
}