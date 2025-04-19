
import 'package:flutter/material.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../model/dto/enum/get_driver_step.dart';
import '../../model/dto/enum/register_check_list_step_type.dart';
import '../../model/dto/register_check_list_item.dart';
import '../../model/register_check_list_model.dart';
import '../../utils/colors.dart';
import '../../utils/shared_strings.dart';
import '../widget/register_check_list_page/register_check_list_page_cancel_button.dart';
import '../widget/register_check_list_page/register_check_list_page_cars_button.dart';
import '../widget/register_check_list_page/register_check_list_page_continue_button.dart';
import '../widget/register_check_list_page/register_check_list_page_fire_extinguisher_card.dart';
import '../widget/register_check_list_page/register_check_list_page_general_card.dart';
import '../widget/register_check_list_page/register_check_list_page_general_card_status.dart';
import '../widget/register_check_list_page/register_check_list_page_get_driver_button.dart';
import '../widget/register_check_list_page/register_check_list_page_signature_card.dart';
import '../widget/register_check_list_page/register_check_list_page_technical_diagnosis_card.dart';
import '../widget/register_check_list_page/register_check_list_page_hint_card.dart';
import '../widget/register_check_list_page/register_check_list_page_step_indicator.dart';
import '../widget/register_check_list_page/register_check_list_page_top_bar.dart';
import '../widget/shared/custom_text_field.dart';



class RegisterCheckListPage extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final Color backgroundColor = MyColors.white;
  final double widgetHorizontalPadding = 0.05;
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(16), color:MyColors.black, fontWeight:FontWeight.bold);
  final TextStyle largeTextStyle = TextStyle(fontSize: ScreenUtil().setSp(16), color:const Color(0xFF2E2E2E));
  final TextStyle smallTextStyle = TextStyle(fontSize: ScreenUtil().setSp(14), color:const Color(0xFF898989));
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<RegisterCheckListModel>(init: RegisterCheckListModel(), builder: (_) => // Initialize RegisterCheckListModel Class For RealTime Data Using GetX State Management
      Scaffold(
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: RegisterCheckListModel.scrollController,
          slivers: [
            SliverFillRemaining(
              // hasScrollBody: false,
              child:
              Column(
                children: [
                  RegisterCheckListPageTopBar(),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthUtil(context, widgetHorizontalPadding)
                      ),
                      child: RegisterCheckListModel().currentStep == RegisterCheckListStepType.issuanceStep?
                      Column(
                        children: [
                          SizedBox(height: heightUtil(context,0.01),),
                          Expanded(child:Container()),
                          RegisterCheckListModel().driverName != null?
                          Text(
                            "${SharedStrings.driverName} : ${RegisterCheckListModel().driverName}",
                            style:textStyle,
                          ):Container(),
                          SizedBox(height: heightUtil(context,0.05),),
                          Row(children: [Expanded(child: Text(RegisterCheckListModel().driverName != null?SharedStrings.driverNationalCode:SharedStrings.enterDriverNationalCode, style: largeTextStyle, textAlign:TextAlign.start,))]),
                          SizedBox(height:heightUtil(context, 0.01),),
                          CustomTextField(
                            textEditingController:
                            RegisterCheckListModel().driverName != null?
                            TextEditingController(text: RegisterCheckListModel.driverNationalCodeController.text):
                            RegisterCheckListModel.driverNationalCodeController,
                            label: '',
                            iconData: null,
                            iconPath: null,
                            isNumeric: true,
                            iconColor: MyColors.deepBlue,
                            maxLength: 10,
                            enabled: RegisterCheckListModel().getDriverStep != GetDriverStep.nationalCode?false:RegisterCheckListModel().driverName == null?true:false,
                          ),

                          RegisterCheckListModel().getDriverStep != GetDriverStep.mobileNumber?Container():
                          SizedBox(height: heightUtil(context,0.02),),
                          RegisterCheckListModel().getDriverStep != GetDriverStep.mobileNumber?Container():
                          Row(children: [
                            Expanded(child: Text(RegisterCheckListModel().driverName != null?SharedStrings.driverMobileNumber:SharedStrings.enterDriverMobileNumber, style: largeTextStyle, textAlign:TextAlign.start,))
                          ]),
                          RegisterCheckListModel().getDriverStep != GetDriverStep.mobileNumber?Container():
                          SizedBox(height:heightUtil(context, 0.01),),
                          RegisterCheckListModel().getDriverStep != GetDriverStep.mobileNumber?Container():
                          CustomTextField(
                            textEditingController:
                            RegisterCheckListModel().driverName != null?
                            TextEditingController(text: RegisterCheckListModel.driverMobileNumberController.text):
                            RegisterCheckListModel.driverMobileNumberController,
                            label: '',
                            iconData: null,
                            iconPath: null,
                            isNumeric: true,
                            iconColor: MyColors.deepBlue,
                            maxLength: 11,
                            enabled:RegisterCheckListModel().getDriverStep != GetDriverStep.mobileNumber?false:RegisterCheckListModel().driverName == null?true:false,
                          ),
                          RegisterCheckListModel().getDriverStep != GetDriverStep.smartCode?Container():
                          SizedBox(height:heightUtil(context, 0.02),),
                          RegisterCheckListModel().getDriverStep != GetDriverStep.smartCode?Container():
                          Row(children: [
                            Expanded(child: Text(SharedStrings.enterCarSmartCode, style: largeTextStyle, textAlign:TextAlign.start,))
                          ]),
                          RegisterCheckListModel().getDriverStep != GetDriverStep.smartCode?Container():
                          SizedBox(height:heightUtil(context, 0.01),),
                          RegisterCheckListModel().getDriverStep != GetDriverStep.smartCode?Container():
                          CustomTextField(
                            textEditingController:RegisterCheckListModel.smartCodeController,
                            label: '',
                            iconData: null,
                            iconPath: null,
                            isNumeric: true,
                            iconColor: MyColors.deepBlue,
                            maxLength: 11,
                            enabled: RegisterCheckListModel().cars.isEmpty,
                          ),
                          SizedBox(height: heightUtil(context,0.01),),
                          RegisterCheckListModel().cars.isEmpty?Container():
                          SizedBox(height: heightUtil(context,0.04),),
                          RegisterCheckListModel().cars.isEmpty?Container():
                          RegisterCheckListPageCarsButton(),
                          SizedBox(height: heightUtil(context,0.01),),
                          Expanded(child:Container()),
                          Row(
                            children: [
                              Expanded(child: RegisterCheckListPageCancelButton()),
                              SizedBox(width:widthUtil(context, 0.025),),
                              Expanded(child: RegisterCheckListPageGetDriverButton()),
                            ],
                          ),
                          SizedBox(height: heightUtil(context,0.02),),
                        ],
                      ):
                      Column(
                        children: [
                          SizedBox(height: heightUtil(context,0.02),),
                          RegisterCheckListPageStepIndicator(),
                          SizedBox(height: heightUtil(context,0.02),),
                          RegisterCheckListPageHintCard(),

                          SizedBox(height: heightUtil(context,0.02),),


                          Expanded(
                            child: CustomScrollView(
                              physics: const BouncingScrollPhysics(),
                              controller: RegisterCheckListModel.scrollController,
                              slivers: [
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                    child:Column(
                                      children:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo1? [
                                        RegisterCheckListPageTechnicalDiagnosisCard(RegisterCheckListModel().items[0]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[1]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[2]),
                                      ]:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo2? [
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[3]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[4]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[5]),
                                      ]:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo3? [
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[6]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[7]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[8]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[9]),
                                      ]:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo4? [
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[10]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[11]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[12]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[13]),
                                      ]:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo5? [
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[14]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[15]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[16]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[17]),
                                      ]:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo6? [
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[18]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[19]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[20]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[21]),
                                      ]:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo7? [
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[22]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[23]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[24]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[25]),
                                      ]:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo8? [
                                        RegisterCheckListPageGeneralCard(RegisterCheckListModel().items[26]),
                                        SizedBox(height: heightUtil(context,0.02),),
                                        RegisterCheckListPageFireExtinguisherCard(RegisterCheckListModel().items[27]),
                                      ]:
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo9?
                                      RegisterCheckListModel().items.map((e) => RegisterCheckListPageGeneralCardStatus(e)).toList():
                                      RegisterCheckListModel().currentStep == RegisterCheckListStepType.signature?
                                      [
                                        Expanded(child: RegisterCheckListPageSignatureCard()),
                                      ]:[
                                        Container()
                                      ],
                                    ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: heightUtil(context,0.01),),
                          Row(
                            children: [
                              Expanded(child: RegisterCheckListPageCancelButton()),
                              SizedBox(width:widthUtil(context, 0.025),),
                              Expanded(child: RegisterCheckListPageContinueButton()),
                            ],
                          ),
                          SizedBox(height: heightUtil(context,0.02),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
  }
}
