import 'package:animate_do/animate_do.dart';
import 'package:bargram_technical_manager/utils/colors.dart';
import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../database/shared_preferences/shared_preferences_manager.dart';
import '../../utils/assets_paths.dart';
import 'login_otp_page.dart';
import 'main_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(18), color:MyColors.black, fontWeight:FontWeight.bold);
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp)  async {
      await Future.delayed(const Duration(milliseconds:1500),(){});
      if(await SharedPreferencesManager.getIsLoggedIn() == false){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginOtpPage(),
            ));
      }
      else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(40),
            child: ZoomIn(
                duration: const Duration(seconds: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetPaths.appLogo),
                    Text(
                      SharedStrings.technicalManager,
                      style:textStyle,
                    )
                  ],
                ),
            )
        ),
      ),
    );
  }
}

