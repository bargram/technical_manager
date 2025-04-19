import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../utils/size_utils.dart';
import '../widget/registered_check_list_page/registered_check_list_page_list.dart';
import '../widget/registered_check_list_page/registered_check_list_page_top_bar.dart';


class RegisteredCheckListsPage extends StatelessWidget{

  //////////////////////////////Widget Styles///////////////////////////////////
  final Color widgetColor = MyColors.lightGrey1.withOpacity(0.5);
  final double widgetHorizontalPadding = 0.05;
  //////////////////////////////End Of Widget Styles////////////////////////////
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: widthUtil(context,widgetHorizontalPadding),
          ),
          color: widgetColor,
           child: Column(
             children: [
               RegisteredCheckListPageTopBar(),
               RegisteredChecklistPageBillLoadingsList(),
               // BillLoadingPageBillLoadingsList(),
             ],
           ),
         ),
       ),
     );
  }
}
