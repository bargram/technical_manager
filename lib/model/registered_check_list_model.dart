import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controller/get_more_registered_check_list_controller.dart';
import 'dto/check_list.dart';
import 'dto/dropdown_item.dart';
import 'dto/filter_type.dart';



class RegisteredCheckListModel extends GetxController{

  static TextEditingController _nationalCodeFilterController = TextEditingController();
  TextEditingController get nationalCodeFilterController => _nationalCodeFilterController;
  set nationalCodeFilterController(value){
    _nationalCodeFilterController = value;
    update();
  }
  static setNationalCodeFilterController(String text){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().nationalCodeFilterController = TextEditingController(text:text):
    _nationalCodeFilterController = TextEditingController(text:text);
  }

  static TextEditingController _mobileNumberFilterController = TextEditingController();
  TextEditingController get mobileNumberFilterController => _mobileNumberFilterController;
  set mobileNumberFilterController(value){
    _mobileNumberFilterController = value;
    update();
  }
  static setMobileNumberFilterController(String text){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().mobileNumberFilterController = TextEditingController(text:text):
    _mobileNumberFilterController = TextEditingController(text:text);
  }

  static TextEditingController _startDateFilterController = TextEditingController();
  TextEditingController get startDateFilterController => _startDateFilterController;
  set startDateFilterController(value){
    _startDateFilterController = value;
    update();
  }
  static setStartDateFilterController(String text){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().startDateFilterController = TextEditingController(text:text):
    _startDateFilterController = TextEditingController(text:text);
  }

  static TextEditingController _endDateFilterController = TextEditingController();
  TextEditingController get endDateFilterController => _endDateFilterController;
  set endDateFilterController(value){
    _endDateFilterController = value;
    update();
  }
  static setEndDateFilterController(String text){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().endDateFilterController = TextEditingController(text:text):
    _endDateFilterController = TextEditingController(text:text);
  }


  //using showing active filters in filter bar
  static List<FilterType> _activeFilters = <FilterType>[];
  List <FilterType> get activeFilters => _activeFilters;
  set activeFilters(value){
    _activeFilters = value;
    update();
  }
  static removeAllActiveFilters(){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().activeFilters = <FilterType>[] : <FilterType>[];
  }
  static addToActiveFiltersList(FilterType filter){
    _activeFilters.add(filter);
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().activeFilters = _activeFilters : null;
  }
  static removeFromActiveFiltersList(FilterType filter){
    _activeFilters.remove(filter);
    if(filter == FilterType.nationalCode) setNationalCodeFilterController('');
    if(filter == FilterType.mobileNumber) setMobileNumberFilterController('');
    if(filter == FilterType.status) setSelectedStatusFilter(null);
    if(filter == FilterType.date) {
      setStartDateFilterController('');
      setEndDateFilterController('');
    }
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().activeFilters = List.of(_activeFilters) : null;
  }




  List<DropDownItem> statusesFilter = <DropDownItem>[
    DropDownItem(title:'تایید شده', value:'CONFIRM'),
    DropDownItem(title:'در انتظار', value:'PENDING'),
    DropDownItem(title:'رد شده', value:'REJECTED'),
  ];
  static DropDownItem? _selectedStatusFilter;
  DropDownItem? get selectedStatusFilter => _selectedStatusFilter;
  set selectedStatusFilter(value){
    _selectedStatusFilter = value;
    update();
  }
  static setSelectedStatusFilter(DropDownItem? value){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().selectedStatusFilter = value:
    _selectedStatusFilter = value;
  }


  //using for showing BillLoadings list
  static List<CheckList> _checklists = <CheckList>[];
  List<CheckList> get checkLists => _checklists;
  set checkLists(value){
    _checklists = value;
    update();
  }
  static setCheckLists(List<CheckList> list){
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().checkLists = List.of(list):
    _checklists = List.of(list);
  }
  static addToEndOfCheckList(List<CheckList> list){
    _checklists.addAll(list);
    //if class is in real time state then we use GetX for setting value else we setting value normally
    changeNotifier ?
    Get.find<RegisteredCheckListModel>().checkLists = List.of(_checklists): null;
  }

  //using for loading turns page index from server
  static int _pageIndex = 1;
  int get paginateIndex => _pageIndex;
  set paginateIndex(value){
    _pageIndex = value;
  }
  static resetPaginateIndex(){
    _pageIndex = 1;
  }
  static incrementPaginateIndex(){
    _pageIndex++;
  }

  //using for detecting turns list has more turns or not
  static bool? _hasMorePaginate;
  bool? get hasMorePaginate => _hasMorePaginate;
  set hasMorePaginate(value){
    _hasMorePaginate = value;
  }
  static setHasMorePaginate(value){
    _hasMorePaginate = value;
  }

  //using for turns list scroll controlling
  static ScrollController paginateScrollController = ScrollController();
  static setNewPaginateScrollController(BuildContext context){
    resetPaginateIndex();
    paginateScrollController = ScrollController();
    setPaginateScrollControllerListener(context);
  }
  static setPaginateScrollControllerListener(BuildContext context){
    paginateScrollController.addListener(() {
      if(paginateScrollController.position.pixels >= paginateScrollController.position.maxScrollExtent){
        // if scroll to end of list then we need load more loads
        GetMoreRegisteredCheckListController.run(context: context);
      }
    });
  }


  //////////////////////////////////////////////////////////////////////////////

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
    super.onClose();
  }
  //////////////////////////////////////////////////////////////////////////////

}