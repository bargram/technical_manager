import 'package:bargram_technical_manager/model/register_check_list_model.dart';
import 'package:bargram_technical_manager/utils/add_zero_to_single_digit_number.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:bargram_technical_manager/view/widget/shared/three_dots_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';
import '../../../controller/register_check_list_controller.dart';
import '../../../model/dto/enum/register_check_list_step_type.dart';
import '../../../utils/shared_strings.dart';
import '../shared/widget_size_detector.dart';



class RegisterCheckListPageContinueButton extends StatefulWidget {

  @override
  State<RegisterCheckListPageContinueButton> createState() => _RegisterCheckListPageContinueButtonState();
}

class _RegisterCheckListPageContinueButtonState extends State<RegisterCheckListPageContinueButton> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle blueTextStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.deepBlue, fontWeight:FontWeight.bold);
  final TextStyle whiteTextStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.white, fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  final Color yellowButtonColor = MyColors.yellowAccent;
  final Color greenButtonColor = MyColors.deepGreen;
  final double widgetVerticalPadding = 0.0125;
  final double widgetHorizontalPadding = 0.025;
  //////////////////////////////End Of Widget Styles////////////////////////////

  double? widgetHeight;

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<RegisterCheckListController>(init: RegisterCheckListController(), builder: (_) => // Initialize RegisterCheckListController Class For RealTime Data Using GetX State Management
      GestureDetector(
      onTap: ()async{



        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo1){
          for(int i=0; i<=2; i++){
            if(RegisterCheckListModel().items[i].approveStatus == null){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmOrDismissItems, isError:true);
              return;
            }
            if(RegisterCheckListModel().items[i].approveStatus == false){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmCheckListItems, isError:true);
              return;
            }
          }
        }

        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo2){
          for(int i=3; i<=5; i++){
            if(RegisterCheckListModel().items[i].approveStatus == null){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmOrDismissItems, isError:true);
              return;
            }
            if(RegisterCheckListModel().items[i].approveStatus == false){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmCheckListItems, isError:true);
              return;
            }
          }
        }

        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo3){
          for(int i=6; i<=9; i++){
            if(RegisterCheckListModel().items[i].approveStatus == null){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmOrDismissItems, isError:true);
              return;
            }
            if(RegisterCheckListModel().items[i].approveStatus == false){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmCheckListItems, isError:true);
              return;
            }
          }
        }

        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo4){
          for(int i=10; i<=13; i++){
            if(RegisterCheckListModel().items[i].approveStatus == null){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmOrDismissItems, isError:true);
              return;
            }
            if(RegisterCheckListModel().items[i].approveStatus == false){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmCheckListItems, isError:true);
              return;
            }
          }
        }

        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo5){
          for(int i=14; i<=17; i++){
            if(RegisterCheckListModel().items[i].approveStatus == null){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmOrDismissItems, isError:true);
              return;
            }
            if(RegisterCheckListModel().items[i].approveStatus == false){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmCheckListItems, isError:true);
              return;
            }
          }
        }

        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo6){
          for(int i=18; i<=21; i++){
            if(RegisterCheckListModel().items[i].approveStatus == null){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmOrDismissItems, isError:true);
              return;
            }
            if(RegisterCheckListModel().items[i].approveStatus == false){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmCheckListItems, isError:true);
              return;
            }
          }
        }

        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo7){
          for(int i=22; i<=25; i++){
            if(RegisterCheckListModel().items[i].approveStatus == null){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmOrDismissItems, isError:true);
              return;
            }
            if(RegisterCheckListModel().items[i].approveStatus == false){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmCheckListItems, isError:true);
              return;
            }
          }
        }

        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo8){
          for(int i=26; i<=27; i++){
            if(RegisterCheckListModel().items[i].approveStatus == null){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmOrDismissItems, isError:true);
              return;
            }
            if(RegisterCheckListModel().items[i].approveStatus == false){
              alert(context: context, title:SharedStrings.validationError, message:SharedStrings.confirmCheckListItems, isError:true);
              return;
            }
          }
        }
        if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.signature){
          if(RegisterCheckListModel().signatureData == null){
            alert(context: context, title:SharedStrings.validationError, message:SharedStrings.signInPlaceHolder, isError:true);
            return;
          }else{
            RegisterCheckListController.run(
                context: context,
                signatureImage: (await RegisterCheckListModel.screenshotController.capture())!,
                govahiname_fani_motabar: '${RegisterCheckListModel().endOfTechnicalDiagnosis!.year}-${addZeroToSingleDigitNumber(RegisterCheckListModel().endOfTechnicalDiagnosis!.month.toString())}-${addZeroToSingleDigitNumber(RegisterCheckListModel().endOfTechnicalDiagnosis!.day.toString())}',
                nationalCode: RegisterCheckListModel.driverNationalCodeController.text,
                carId: RegisterCheckListModel().selectedCar!.id,
                salamat_zaheri_ring_lastik: RegisterCheckListModel().items[1].approveStatus!,
                hade_aqal_aj_lastik: RegisterCheckListModel().items[2].approveStatus!,
                salamat_sistem_satmayeshi_garmayeshi: RegisterCheckListModel().items[3].approveStatus!,
                salamat_barf_pak_kon: RegisterCheckListModel().items[4].approveStatus!,
                salamat_shishe_jolo: RegisterCheckListModel().items[5].approveStatus!,
                jabe_komak_haye_avaliye: RegisterCheckListModel().items[6].approveStatus!,
                mosalas_shabrang_va_cheraq_cheshmak_zan: RegisterCheckListModel().items[7].approveStatus!,
                cheraq_jolo_aqab_neshanegar_janebi: RegisterCheckListModel().items[8].approveStatus!,
                sheraq_rahnama_boq_ayene: RegisterCheckListModel().items[9].approveStatus!,
                alaem_hoshdar: RegisterCheckListModel().items[10].approveStatus!,
                vaziyate_zaheri: RegisterCheckListModel().items[11].approveStatus!,
                hefazhaye_janebi: RegisterCheckListModel().items[12].approveStatus!,
                salamat_kamarband: RegisterCheckListModel().items[13].approveStatus!,
                tajhizat_etesali_be_keshande: RegisterCheckListModel().items[14].approveStatus!,
                salamat_amalkard_tormoz: RegisterCheckListModel().items[15].approveStatus!,
                amade_be_kar_bodan_sanjesh_sorat_zaman: RegisterCheckListModel().items[16].approveStatus!,
                vaziyat_sistem_farman: RegisterCheckListModel().items[17].approveStatus!,
                adam_taqir_ajzaye_fani: RegisterCheckListModel().items[18].approveStatus!,
                zanjir_charkh_tajhizat_pashesh_gel: RegisterCheckListModel().items[19].approveStatus!,
                salamat_sabet_bodan_mahal_batry: RegisterCheckListModel().items[20].approveStatus!,
                vaziyate_makhzan_sokht: RegisterCheckListModel().items[21].approveStatus!,
                nadashtan_dod: RegisterCheckListModel().items[22].approveStatus!,
                tatbiq_pelak: RegisterCheckListModel().items[23].approveStatus!,
                adam_nasb_tajhizat_qeyr_zaror: RegisterCheckListModel().items[24].approveStatus!,
                roayat_mane_moqararat: RegisterCheckListModel().items[25].approveStatus!,
                mahar_sahih_bar_va_chideman: RegisterCheckListModel().items[26].approveStatus!,
              tarikh_kapsol_atashneshani: '${RegisterCheckListModel().endOFireExtinguisherValidation!.year}-${addZeroToSingleDigitNumber(RegisterCheckListModel().endOFireExtinguisherValidation!.month.toString())}-${addZeroToSingleDigitNumber(RegisterCheckListModel().endOFireExtinguisherValidation!.day.toString())}',
            );
          }
         }

        if(RegisterCheckListModel().currentStep != RegisterCheckListStepType.signature){
          var current = RegisterCheckListModel().currentStep;
          current = RegisterCheckListStepType.values[RegisterCheckListModel().currentStep.index+1];
          RegisterCheckListModel.setCurrentStep(current);
        }
      },
      child: WidgetSize(
        onChange: (Size size){
          if(widgetHeight == null){
            widgetHeight = size.height;
            setState(() {});
          }
        },
        child: Container(
          height: widgetHeight,
            padding: EdgeInsets.symmetric(
              vertical: heightUtil(context,widgetVerticalPadding),
              horizontal: heightUtil(context,widgetHorizontalPadding),
            ),
            decoration: BoxDecoration(
              color: RegisterCheckListModel().currentStep == RegisterCheckListStepType.signature?
              greenButtonColor:yellowButtonColor,
              borderRadius: BorderRadius.circular(widgetBorderRadius),
            ),
            child: Center(
                child: RegisterCheckListController().loadingState?
                    Center(child:ThreeDotsLoading(color:MyColors.white),):
                Text(
                  RegisterCheckListModel().currentStep == RegisterCheckListStepType.signature?
                  SharedStrings.finalApprove: SharedStrings.continueText,
                  style: RegisterCheckListModel().currentStep == RegisterCheckListStepType.signature?
                  whiteTextStyle:blueTextStyle,
                )
            )
        ),
      ),
      )
      );
  }
}

