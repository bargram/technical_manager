import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../controller/get_all_registered_check_list_controller.dart';
import '../../../controller/get_more_registered_check_list_controller.dart';
import '../../../model/registered_check_list_model.dart';
import '../shared/custom_loading.dart';
import 'registered_check_list_page_list_item.dart';



//Loads List Widget
class RegisteredChecklistPageBillLoadingsList extends StatefulWidget {

  @override
  State<RegisteredChecklistPageBillLoadingsList> createState() => _RegisteredChecklistPageBillLoadingsListState();
}

class _RegisteredChecklistPageBillLoadingsListState extends State<RegisteredChecklistPageBillLoadingsList> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final Color refreshIndicatorColor = Colors.black;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_){//For Getting Context Flutter Need This In InitState
      //run controller
      GetAllRegisteredCheckListController.run(context: context);
      RegisteredCheckListModel.setNewPaginateScrollController(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<GetMoreRegisteredCheckListController>(init: GetMoreRegisteredCheckListController(), builder: (_) => // Initialize GetMoreRegisteredCheckListController Class For RealTime Data Using GetX State Management
      GetBuilder<GetAllRegisteredCheckListController>(init: GetAllRegisteredCheckListController(), builder: (_) => // Initialize GetAllRegisteredCheckListController Class For RealTime Data Using GetX State Management
      GetBuilder<RegisteredCheckListModel>(init: RegisteredCheckListModel(), builder: (_) => // Initialize RegisteredCheckListModel Class For RealTime Data Using GetX State Management
      Expanded(
      child: GetAllRegisteredCheckListController().loadingState ?
        CustomLoading():
      Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: ()async{
                GetAllRegisteredCheckListController.run(context: context);
              },
              color: refreshIndicatorColor,
              child: RegisteredCheckListModel().checkLists.isEmpty?
                  Center(child:Text(SharedStrings.checkListIsEmpty),):
              ListView(
                controller: RegisteredCheckListModel.paginateScrollController,
                children: RegisteredCheckListModel().checkLists.map((item){
                  return RegisteredCheckListPageBillLoadingsListItem(item);
                }).toList(),
              ),
            ),
          ),
          GetMoreRegisteredCheckListController().loadingState == true ?
          CustomLoading():
          Container()
        ],
      ),
    )
      )));
  }
}
