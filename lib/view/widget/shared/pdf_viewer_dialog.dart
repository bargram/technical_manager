//
// import 'package:bargram_technical_manager/view/widget/shared/pdf_viewer.dart';
// import 'package:bargram_technical_manager/view/widget/shared/three_dots_loading.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:pdfx/pdfx.dart';
// import '../../../controller/download_pdf_conrtoller.dart';
// import '../../../model/pdf_model.dart';
// import '../../../utils/colors.dart';
// import '../../../utils/size_utils.dart';
// import '../../../utils/strings/shared_strings.dart';
// import '../../../utils/url_launcher_manager.dart';
// import 'package:share_plus/share_plus.dart';
//
//
//
//
//
// Future PDFViewrDialog({required BuildContext context, required String pdfURL})async{
//   const double widgetHorizontalPadding = 0.05;
//   final Color widgetBackgroundColor = MyColors.green.withOpacity(0.10);
//   final Color photoBackgroundColor = MyColors.white;
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder:(context, setStater){
//             return Container(
//               padding:EdgeInsets.symmetric(
//                   horizontal:widthUtil(context, widgetHorizontalPadding)
//               ),
//               color: widgetBackgroundColor,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height:heightUtil(context,0.03),),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       _DismissIcon()
//                     ],
//                   ),
//                   SizedBox(height:heightUtil(context,0.01),),
//                   Expanded(
//                       flex:2,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child:Container(
//                           color: photoBackgroundColor,
//                           child: _PDFViewer(pdfURL),
//                         ),
//                       )
//                   ),
//                   SizedBox(height:heightUtil(context,0.01),),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       _DownloadIcon(pdfURL),
//                       SizedBox(width:widthUtil(context, 0.05),),
//                       _ShareIcon(pdfURL)
//                     ],
//                   ),
//                   SizedBox(height:heightUtil(context,0.03),),
//                 ],
//               ),
//             );
//           },
//         );
//       }
//   );
// }
//
//
// class _DismissIcon extends StatelessWidget {
//   //////////////////////////////Widget Styles///////////////////////////////////
//   final double iconSize = ScreenUtil().setSp(35);
//   final Color iconColor = MyColors.green;
//   final Color iconHolderColor = MyColors.white;
//   //////////////////////////////End Of Widget Styles////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             shape:BoxShape.circle,
//             color: iconHolderColor
//         ),
//         child: Center(
//           child: GestureDetector(
//               onTap: (){
//                 Navigator.pop(context);
//               },
//               child: Icon(CupertinoIcons.clear, size:iconSize, color:iconColor,)
//           ),
//         )
//     );
//   }
// }
//
//
// class _ShareIcon extends StatelessWidget {
//
//   //Constructor
//   String pdfURL;
//   _ShareIcon(this.pdfURL);
//   ////////////
//
//   //////////////////////////////Widget Styles///////////////////////////////////
//   final double iconSize = ScreenUtil().setSp(35);
//   final Color iconColor = MyColors.green;
//   final Color iconHolderColor = MyColors.white;
//   //////////////////////////////End Of Widget Styles////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             shape:BoxShape.circle,
//             color: iconHolderColor
//         ),
//         child: Center(
//           child: GestureDetector(
//               onTap: (){
//                 Share.share(pdfURL);
//               },
//               child: Icon(Icons.share, size:iconSize, color:iconColor,)
//           ),
//         )
//     );
//   }
// }
//
//
// class _DownloadIcon extends StatelessWidget {
//
//   //Constructor
//   String pdfURL;
//   _DownloadIcon(this.pdfURL);
//   ////////////
//
//   //////////////////////////////Widget Styles///////////////////////////////////
//   final double iconSize = ScreenUtil().setSp(35);
//   final Color iconColor = MyColors.green;
//   final Color iconHolderColor = MyColors.white;
//   //////////////////////////////End Of Widget Styles////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             shape:BoxShape.circle,
//             color: iconHolderColor
//         ),
//         child: Center(
//           child: GestureDetector(
//               onTap: (){
//                 UrlLauncherManager.launchInBrowser(context, pdfURL);
//               },
//               child: Icon(Icons.download, size:iconSize, color:iconColor,)
//           ),
//         )
//     );
//   }
// }
//
//
//
//
//
// class _PDFViewer extends StatefulWidget {
//
//   //Constructor
//   String url;
//   _PDFViewer(this.url);
//   ///////////
//
//   @override
//   State<_PDFViewer> createState() => _PDFViewerState(this.url);
// }
//
// class _PDFViewerState extends State<_PDFViewer> {
//
//   //Constructor
//   String url;
//   _PDFViewerState(this.url);
//   ///////////
//
//
//   //////////////////////////////Widget Styles///////////////////////////////////
//   final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: Colors.black.withOpacity(0.9), fontWeight:FontWeight.bold);
//   final Color widgetBackgroundColor = MyColors.white;
//   //////////////////////////////End Of Widget Styles////////////////////////////
//
//   int? pageIndex ;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
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
//       Center(child:Text(SharedStrings.errorDownloadPDF, style:textStyle,)):
//       GestureDetector(
//         onTap: (){
//           PDFViewrDialog(context:context, pdfURL:url);
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
//                 '${PdfModel.pdfController.pagesCount} / $pageIndex', style:textStyle,)
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
