
import 'package:bargram_technical_manager/model/register_check_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';
import '../../../controller/get_driver_controller.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';
import '../shared/alert.dart';
import '../shared/custom_divider.dart';
import '../shared/plaque.dart';
import '../shared/splash_button.dart';



class RegisterCheckListPageCarsButton extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.lightBlack, fontWeight:FontWeight.bold);

  final double widgetVerticalPadding = 0.04;
  final double widgetBorderRadius = 5;

  final double iconSize = 20;
  final Color widgetColor = MyColors.white;
  final Color iconColor = MyColors.lightBlack;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        if(GetDriverController().loadingState == true) return;
        if(RegisterCheckListModel().cars.isEmpty){
          await alert(context: context, title:SharedStrings.fleetError, message:SharedStrings.fleetEmptyError);
          Navigator.pop(context);
          return;
        }
        // Navigator.push(context, MaterialPageRoute(builder:(_)=>RegisterBillLoadingCarsPage()));
        _DropDownDialog(context:context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widgetColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(widgetBorderRadius)
        ),
        padding: EdgeInsets.symmetric(
            vertical: widthUtil(context,widgetVerticalPadding)
        ),
        child: Row(
          children: [
            SizedBox(width:widthUtil(context, 0.05),),
            Expanded(
                child: Text(RegisterCheckListModel().selectedCar == null?
                '${SharedStrings.choose} ${SharedStrings.car} ':
                '${SharedStrings.car} : ${RegisterCheckListModel().selectedCar!.carTypeTitle==SharedStrings.unknown?'':RegisterCheckListModel().selectedCar!.carTypeTitle}',
                    style:textStyle,
                  textAlign: TextAlign.start,
                )
            ),
            // RegisterCheckListModel().selectedCar == null? Container():
            // RegisterCheckListModel().selectedCar!.carTypeTitle != SharedStrings.unknown?Container():
            // Expanded(child:Container()),
            RegisterCheckListModel().selectedCar == null? Container():
            RegisterCheckListModel().selectedCar!.carTypeTitle != SharedStrings.unknown?Container():
                Center(
                  child: Plaque(RegisterCheckListModel().selectedCar!.plaque.length>1?RegisterCheckListModel().selectedCar!.plaque[0]+RegisterCheckListModel().selectedCar!.plaque[1]:'-',
                    RegisterCheckListModel().selectedCar!.plaque.length>3?RegisterCheckListModel().selectedCar!.plaque[3]:'-',
                    RegisterCheckListModel().selectedCar!.plaque.length>7? RegisterCheckListModel().selectedCar!.plaque[5]+RegisterCheckListModel().selectedCar!.plaque[6]+RegisterCheckListModel().selectedCar!.plaque[7]:'-',
                    RegisterCheckListModel().selectedCar!.plaque.length>10? RegisterCheckListModel().selectedCar!.plaque[9]+RegisterCheckListModel().selectedCar!.plaque[10]:'-',
                  ),
                ),
            RegisterCheckListModel().selectedCar == null? Container():
            RegisterCheckListModel().selectedCar!.carTypeTitle != SharedStrings.unknown?Container():
            Expanded(child:Container()),
            Icon(Icons.arrow_forward_ios_rounded, size:iconSize, color:iconColor,),
            SizedBox(width:widthUtil(context, 0.025),)
          ],
        ),
      ),
    );
  }
}


Future _DropDownDialog({
  required BuildContext context,
})async{
  final Color widgetColor = MyColors.lightGrey1;
  const double widgetBorderRadius = 5;
  const double widgetHorizontalMargin = 0.05;
  const double widgetVerticalPadding = 0.015;
  const double widgetHorizontalPadding = 0.025;
  final TextStyle smallTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color: MyColors.deepBlue, fontFamily:FontsManager.vazir);
  final TextStyle largeTextStyle = TextStyle(fontSize:ScreenUtil().setSp(16), color: MyColors.black, fontFamily:FontsManager.vazir, fontWeight:FontWeight.bold);
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepGreen, fontWeight:FontWeight.bold);
  const double iconWidth = 0.05;
  final Color iconColor = MyColors.deepYellow;
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) =>
          GetBuilder<RegisterCheckListModel>(init: RegisterCheckListModel(), builder: (_) => // Initialize RegisterCheckListModel Class For RealTime Data Using GetX State Management
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
                                              '${SharedStrings.fleet} ${SharedStrings.select2}',
                                              style: largeTextStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height:heightUtil(context,0.01),),

                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: RegisterCheckListModel().cars.map((e) =>
                                              GestureDetector(
                                                onTap: (){
                                                  RegisterCheckListModel.setSelectedCar(e);
                                                  Navigator.pop(context);
                                                },
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      CustomDivider(height:1, width:widthUtil(context, 0.95), color:MyColors.grey.withOpacity(0.5), borderRadius:20,),
                                                      SizedBox(height:heightUtil(context, widgetVerticalPadding/2)),
                                                      // SizedBox(height:heightUtil(context, widgetVerticalPadding/2)),
                                                      Row(
                                                        children: [
                                                          // Checkbox(
                                                          //     value: e.selected,
                                                          //     onChanged: (value){
                                                          //       RegisterCheckListModel.setCarSelectionInCarsList(e.id, !e.selected);
                                                          //     }
                                                          // ),
                                                          Expanded(
                                                            child: Text(
                                                              e.carTypeTitle.toString() == 'null'? SharedStrings.carTypeNotSpecified: e.carTypeTitle.toString(),
                                                              style: smallTextStyle,
                                                              textAlign: TextAlign.center,
                                                              // overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                          Plaque(e.plaque.length>1?e.plaque[0]+e.plaque[1]:'-',
                                                            e.plaque.length>3?e.plaque[3]:'-',
                                                            e.plaque.length>7? e.plaque[5]+e.plaque[6]+e.plaque[7]:'-',
                                                            e.plaque.length>10? e.plaque[9]+e.plaque[10]:'-',
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height:heightUtil(context, widgetVerticalPadding)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ).toList(),
                                      ),
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
