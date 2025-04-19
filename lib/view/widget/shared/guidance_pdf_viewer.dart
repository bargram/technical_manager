// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import '../../../utils/colors.dart';
// import '../../../utils/size_utils.dart';
// import '../shared/three_dots_loading.dart';
//
//
//
//
// class GuidancePDFViewer extends StatefulWidget {
//
//   //Constructor
//   String url;
//   GuidancePDFViewer(this.url);
//   ///////////
//   static show(BuildContext context, String url){
//     const double widgetHorizontalMargin = 0.05;
//     const double widgetVerticalMargin = 0.05;
//     // final Color widgetColor = MyColors.lightBlue.withOpacity(0.4);
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return Dialog(
//               shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//               insetPadding: EdgeInsets.symmetric(
//                 horizontal: widthUtil(context, widgetHorizontalMargin),
//                 vertical: heightUtil(context, widgetVerticalMargin),
//               ),
//               child: ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(20)),
//                   child:GuidancePDFViewer(url)
//               )
//           );
//         }
//     );
//   }
//
//   @override
//   State<GuidancePDFViewer> createState() => _GuidancePDFViewerState(this.url);
// }
//
// class _GuidancePDFViewerState extends State<GuidancePDFViewer> {
//
//   //Constructor
//   String url;
//   _GuidancePDFViewerState(this.url);
//   ///////////
//
//
//   //////////////////////////////Widget Styles///////////////////////////////////
//   final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: Colors.black.withOpacity(0.9), fontWeight:FontWeight.bold);
//   final Color widgetBackgroundColor = MyColors.white;
//   final double iconWidth = 0.1;
//   final Color iconColor = Colors.black;
//   //////////////////////////////End Of Widget Styles////////////////////////////
//
//   int pageIndex = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) {//For Getting Context Flutter Need This In InitState
//       // DownloadGuidancePdfFileController.run(context: context, pdfURL: url);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       GetBuilder<DownloadGuidancePdfFileController>(init: DownloadGuidancePdfFileController(), builder: (_) => // Initialize DownloadGuidancePdfFileController Class For RealTime Data Using GetX State Management
//       GetBuilder<SharedModel>(init: SharedModel(), builder: (_) => // Initialize SharedModel Class For RealTime Data Using GetX State Management
//       DownloadGuidancePdfFileController().loadingState ?
//       Center(child:ThreeDotsLoading(),):
//       SharedModel().pdfController == null ? Container():
//       // SharedModel().pdfFile == null ?
//       // Center(child:Text(SharedStrings.errorDownloadPDF, style:textStyle,)):
//       Column(
//         children: [
//           SizedBox(height:heightUtil(context, 0.025),),
//           Row(
//             children: [
//               SizedBox(width:widthUtil(context, 0.025),),
//               GestureDetector(
//                 onTap:()=> Navigator.pop(context),
//                 child: SizedBox(
//                   height: widthUtil(context,iconWidth),
//                   width: widthUtil(context,iconWidth),
//                   child: FittedBox(child: Icon(Icons.close_sharp, color: iconColor,)),
//                 ),
//               ),
//               Expanded(flex:2,child:Container()),
//               Text(
//                 SharedStrings.guidanceFile,
//                 style: textStyle,
//                 textAlign: TextAlign.center,
//               ),
//               Expanded(flex:3,child:Container()),
//             ],
//           ),
//           // SizedBox(height:heightUtil(context, 0.025),),
//           pageIndex == null ?
//           Container():
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(SharedModel().pdfController!.pagesCount.toString() == 'null' ? '' :
//               '${SharedModel().pdfController!.pagesCount} / $pageIndex', style:textStyle,)
//             ],
//           ),
//           Expanded(
//             child: Stack(
//               children: [
//                 PdfView(
//                     controller: SharedModel().pdfController!,
//                     scrollDirection: Axis.vertical,
//                     onPageChanged: (int page){
//                       pageIndex = page;
//                       setState((){});
//                     },
//                     onDocumentLoaded: (PdfDocument document){
//                       pageIndex = document.pagesCount;
//                       setState(() {});
//                     },
//                     renderer: (PdfPage page) {
//                       pageIndex = page.pageNumber;
//                       setState((){});
//                       return page.render(
//                         width: page.width * 1,
//                         height: page.height * 1,
//                       );
//                     }
//                 ),
//                 pageIndex == null ?Center(child: ThreeDotsLoading(),): Container()
//               ],
//             ),
//           ),
//         ],
//       )
//       ));
//   }
// }
