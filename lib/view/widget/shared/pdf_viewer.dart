// import 'package:bargram_technical_manager/view/widget/shared/pdf_viewer_dialog.dart';
// import 'package:bargram_technical_manager/view/widget/shared/three_dots_loading.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import '../../../utils/colors.dart';
// import '../../../utils/size_utils.dart';
//
//
//
//
//
// class PDFViewer extends StatefulWidget {
//
//   //Constructor
//   String url;
//   PDFViewer(this.url);
//   ///////////
//
//   @override
//   State<PDFViewer> createState() => _PDFViewerState(this.url);
// }
//
// class _PDFViewerState extends State<PDFViewer> {
//
//   //Constructor
//   String? url;
//   _PDFViewerState(this.url);
//   ///////////
//
//
//   //////////////////////////////Widget Styles///////////////////////////////////
//   final TextStyle largeTextStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: Colors.black.withOpacity(0.9), fontWeight:FontWeight.bold);
//   final TextStyle smallTextStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: Colors.black.withOpacity(0.9), fontWeight:FontWeight.bold);
//   final Color widgetBackgroundColor = MyColors.white;
//   //////////////////////////////End Of Widget Styles////////////////////////////
//
//   int? pageIndex ;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) {//For Getting Context Flutter Need This In InitState
//       DownloadPDFController.run(context: context, pdfURL: url.toString());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       GetBuilder<DownloadPDFController>(init: DownloadPDFController(), builder: (_) => // Initialize DownloadPDFController Class For RealTime Data Using GetX State Management
//       GetBuilder<PdfModel>(init: PdfModel(), builder: (_) => // Initialize PdfModel Class For RealTime Data Using GetX State Management
//       DownloadPDFController().loadingState ?
//       Center(child:ThreeDotsLoading(),):
//       PdfModel().pdfFile == null ?
//       Center(child:Text(SharedStrings.errorDownloadPDF, style:smallTextStyle,)):
//       GestureDetector(
//         onTap: (){
//           PDFViewrDialog(context:context, pdfURL:url!);
//         },
//         child: Column(
//           children: [
//             SizedBox(height:heightUtil(context, 0.05),),
//             pageIndex == null ?
//             Container():
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(PdfModel.pdfController.pagesCount.toString() == 'null' ? '' :
//                 '${PdfModel.pdfController.pagesCount} / $pageIndex', style:largeTextStyle,)
//               ],
//             ),
//             Expanded(
//               child: PdfView(
//                   controller: PdfModel.pdfController,
//                   scrollDirection: Axis.vertical,
//                   onPageChanged: (int page){
//                     pageIndex = page;
//                     setState((){});
//                   },
//                   renderer: (PdfPage page) {
//                     pageIndex = page.pageNumber;
//                     setState((){});
//                     return page.render(
//                       width: page.width * 2,
//                       height: page.height * 2,
//                     );
//                   }
//               ),
//             ),
//           ],
//         ),
//       )
//       ));
//   }
// }
