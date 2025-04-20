import 'dart:async';
import 'dart:io';
import 'package:bargram_technical_manager/service/local_service.dart';
import 'package:bargram_technical_manager/utils/colors.dart';
import 'package:bargram_technical_manager/utils/fonts.dart';
import 'package:bargram_technical_manager/utils/logger.dart';
import 'package:bargram_technical_manager/view/page/splash_page.dart';
import 'package:face_camera/face_camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'database/shared_preferences/shared_preferences_manager.dart';







class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}




void main()async{

  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();//Flutter Need This

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  // pattern.allMatches((await SharedPreferencesManager.getAccessToken())).forEach((match) => print(match.group(0)));
  // await SharedPreferencesManager.setAccessToken('eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTM3YmFlOS1mYzU1LTQ2MjEtOTVhNi04YzUyNGI2Y2VmYTYiLCJqdGkiOiI1ODU1YTJjODI5M2I3ZjNkYTdkNjlhOTMwMDg4YzRiNTk4NmU1ZDQ5Y2ZmN2MwMDMwOGVlZGMwMDgzNTY5MTg5NjBiMmZiYjg3ODYyYjkyNCIsImlhdCI6MTczMTEzNzI5Mi41NDU4MzgsIm5iZiI6MTczMTEzNzI5Mi41NDU4NDUsImV4cCI6MTc2MjY3MzI5Mi40OTQwOTMsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.k9qhAvjjkpd6Dq1sAHDjDx8j0wKtsggOdnAZg1cmoq3Rswh2PRFgb_Qzi3Kv54M2PVJvtGXlNiiHQgWdQ8ryxAJL4OasUjDpBLimHaoX95sad1jY4B7HvKA4glgZeZtoL_4FrRCP3lPUObbV1LwFYebCt5UqWfYr6Y8aasT_7dgLHnDkn5JGkyGKj8a6rFQsRusSbCakzHMOPMejEvziFfz-c3vKw3qB02SCnafbgvraZOmDpzDA-361Rgj4Xz0P3ZgPjAsvNz_AiaB1U01DkQF6xqEi5VtTe6cRidBQCjXhZ8g-nDg4Vq9_4li4LH_oqS9ax8cp_6tRVFj_fcad9GCcJEHg2-Mwjrprosp0fxFSOp6r3J8RIz_eZwgfHQ9fRzeRPm3XJYeHiXbvudEvuH0GmjNzLvyfYVGbiBkqfS90xRGuGffFGU_ChBxCB73tKafNQfV-rS0iwIKQcXunkKxDEcplTDH6LZUkq9MTP7q8-3K5_hqb4hqJzq20rLfmggURlz3JWpexyrjdGYQjFKjI-Ny8wXGxhRrl2l0lkeP7Hv1vNpHtuZo8C0DD6frWg6uLyjtbKJ2TYoNh7KwdrWiWARqZ68k5XM2jbEAQ86q7EwbO2LHKIc3nGaA-eKzxQ6rn8ojmvdH9qeAkvEUH2g8Jt5dI1lEfFZVX8w8bw-o');
  // try{
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform
  //   );
  //   await FirebaseNotification.initFirebaseInAppMessaging();
  //   FirebaseMessaging.onBackgroundMessage(FirebaseNotification.initFirebaseBackgroundMessaging);
  // }catch(err){
  //   Logger.consolePrint(err);
  // }
  await FaceCamera.initialize();

  try{
    // await LocalNotificationService.init();
    await LocalService.runMultipleServices();
    // await DeepLinkManager.detectLaunchedURL();
  }catch(err){
    Logger.consolePrint(err);
  }

  runApp(AppLauncher());
  //RUN App
}



class AppLauncher extends StatelessWidget {
  // The navigator key is necessary to navigate using static methods
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
          onTap: () {
            //For unFocusing by tapping outside of any text field or etc
            FocusManager.instance.primaryFocus!.unfocus();
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: MaterialApp(

            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: FontsManager.vazir,
              colorScheme: ColorScheme.fromSeed(
                seedColor: MyColors.blue,
                brightness: Brightness.light,
              ),
            ),
            supportedLocales: const [
              Locale('fa', ''),
            ],
            localizationsDelegates: const [
              FallbackCupertinoLocalizationsDelegate(), // for cupertino dialog crashing
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: EasyLoading.init(),
            home:
            ScreenSizeInitializer(),
            // ForegroundService(isLoggedIn),
          )
      );
  }
}





//Initial Screen Utils for responsive design
class ScreenSizeInitializer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        builder: (_,__) =>
        // SharedModel().appLockedForUpdate ?
        // ForceUpdatePage():
        SplashPage()
    );
  }
}

//using for preventing cupertino alert crashing
class FallbackCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => true;
  @override
  Future<CupertinoLocalizations> load(Locale locale) => DefaultCupertinoLocalizations.load(locale);
  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}

//this class remove scroll glow effect
class ScrollGlowRemover extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

//
// class ForegroundService   extends StatefulWidget {
//   bool isLoggedIn;
//   ForegroundService(this.isLoggedIn);
//   @override
//   State<ForegroundService> createState() => _ForegroundServiceState();
// }
//
// class _ForegroundServiceState extends State<ForegroundService> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     PermissionManager.requestForegroundPermission();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return WillStartForegroundTask(
//       onWillStart: () async {
//         // Return whether to start the foreground service.
//         return true;
//       },
//       androidNotificationOptions: AndroidNotificationOptions(
//         channelId: 'notification_channel_id',
//         channelName: 'Foreground Notification',
//         channelDescription: 'This notification appears when the foreground service is running.',
//         channelImportance: NotificationChannelImportance.LOW,
//         priority: NotificationPriority.LOW,
//         isSticky: false, // important
//         iconData: const NotificationIconData(
//           resType: ResourceType.mipmap,
//           resPrefix: ResourcePrefix.ic,
//           name: 'launcher',
//         ),
//         buttons: [
//           // const NotificationButton(id: 'sendButton', text: 'Send'),
//           // const NotificationButton(id: 'testButton', text: 'Test'),
//         ],
//       ),
//       iosNotificationOptions: const IOSNotificationOptions(
//         showNotification: true,
//         playSound: false,
//       ),
//       foregroundTaskOptions: const ForegroundTaskOptions(
//         interval: 60000 * 1 *5000,
//         isOnceEvent: false,
//         allowWakeLock: false,
//         allowWifiLock: false,
//       ),
//       notificationTitle: 'سرویس موقعیت مکانی',
//       notificationText: 'سرویس موقعیت مکانی بارگرام فعال است',
//       callback: startCallback,
//       // onData: _onData,
//       child: ScreenSizeInitializer(widget.isLoggedIn),
//     );
//   }
// }