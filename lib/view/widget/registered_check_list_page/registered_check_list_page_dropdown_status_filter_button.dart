import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/registered_check_list_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';
import '../shared/splash_button.dart';




class RegisteredCheckListPageDropdownStatusFilterButton extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color: MyColors.deepBlue);
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                SharedStrings.status,
                style:textStyle,
              ),
            ),
          ],
        ),
        SizedBox(height:heightUtil(context, 0.005),),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _DropDownButton()
            )
          ],
        ),
      ],
    );
  }
}


class _DropDownButton extends StatelessWidget {

  // List of items in our dropdown menu
  // List<DropDownItem> items = <DropDownItem>[
  //   DropDownItem(title:Strings.nameAndLastname, value: '1'),
  // ];
  /////////////////////////////////////


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color: MyColors.deepGrey);

  final double iconSize = 25;
  final Color iconColor = MyColors.yellowAccent;

  final double widgetHorizontalPadding = 0.025;
  final double widgetVerticalPadding = 0.02;

  final Color backgroundColor = const Color(0xFFFFFFFF);
  final Color buttonBorderColor = MyColors.grey;
  final double buttonBorderRadius = 10;
  //////////////////////////////End Of Widget Styles////////////////////////////



  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<RegisteredCheckListModel>(init: RegisteredCheckListModel(), builder: (_) => // Initialize RegisterBillLoadingModel Class For RealTime Data Using GetX State Management
      GestureDetector(
      onTap: (){
        _DropDownDialog(context:context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalPadding),
          vertical: heightUtil(context,widgetVerticalPadding),
        ),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
          color: backgroundColor,
          border: Border.all(
            color: buttonBorderColor,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                RegisteredCheckListModel().selectedStatusFilter != null? RegisteredCheckListModel().selectedStatusFilter!.title:
                "${SharedStrings.status} ${SharedStrings.select2}",
                style: textStyle,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_sharp,),
          ],
        ),
      ),
    ));
  }
}



Future _DropDownDialog({
  required BuildContext context,
})async{
  final Color widgetColor = MyColors.lightGrey1;
  const double widgetBorderRadius = 5;
  const double widgetHorizontalMargin = 0.05;
  const double widgetHorizontalPadding = 0.025;
  final TextStyle smallTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color: MyColors.deepBlue, fontFamily:FontsManager.vazir);
  final TextStyle largeTextStyle = TextStyle(fontSize:ScreenUtil().setSp(16), color: MyColors.black, fontFamily:FontsManager.vazir, fontWeight:FontWeight.bold);
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) =>
          GetBuilder<RegisteredCheckListModel>(init: RegisteredCheckListModel(), builder: (_) => // Initialize RegisterBillLoadingModel Class For RealTime Data Using GetX State Management
          Container(
            margin:EdgeInsets.symmetric(
              horizontal:widthUtil(context, widgetHorizontalMargin),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height:heightUtil(context,0.01),),
                  Expanded(
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            children: [
                              Expanded(child:GestureDetector(onTap: ()=>Navigator.pop(context),)),
                              Container(
                                padding:EdgeInsets.symmetric(
                                    horizontal:widthUtil(context, widgetHorizontalPadding)
                                ),
                                decoration: BoxDecoration(
                                    color: widgetColor,
                                    borderRadius: BorderRadius.circular(widgetBorderRadius)
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height:heightUtil(context,0.01),),
                                    Row(
                                      children: [
                                        Expanded(
                                          child:Text(
                                            '${SharedStrings.status} ${SharedStrings.select2}',
                                            style: largeTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: RegisteredCheckListModel().statusesFilter.map((e) =>
                                            GestureDetector(
                                              onTap: (){
                                                if(RegisteredCheckListModel().selectedStatusFilter == e){
                                                  RegisteredCheckListModel.setSelectedStatusFilter(null);
                                                }
                                                else{
                                                  RegisteredCheckListModel.setSelectedStatusFilter(e);
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                      value: RegisteredCheckListModel().selectedStatusFilter == null? false:
                                                      e.title == RegisteredCheckListModel().selectedStatusFilter!.title,
                                                      onChanged: (value){
                                                        if(value == false){
                                                          RegisteredCheckListModel.setSelectedStatusFilter(null);
                                                        }
                                                        else{
                                                          RegisteredCheckListModel.setSelectedStatusFilter(e);
                                                        }
                                                      }
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      e.title,
                                                      style: smallTextStyle,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ).toList()
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                  SizedBox(height:heightUtil(context, 0.02),),
                  SplashButton(onTap:()=>{}, text:SharedStrings.confirm),
                  SizedBox(height:heightUtil(context, 0.015),),
                ],
              ),
            ),
          )
          )
  );
}
