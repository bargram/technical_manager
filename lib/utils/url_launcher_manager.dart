import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:url_launcher/url_launcher_string.dart';

import '../view/widget/shared/alert.dart';


class UrlLauncherManager {

  static Future launchInWebView(BuildContext context, String url)async{
    try{
      await url_launcher.launchUrl(Uri.parse(url));
    }catch(err){
      alert(context:context, title:'', message:SharedStrings.canLaunchThisURL);
    }
  }

  static Future launchInBrowser(BuildContext context, String url)async{
    try{
      await url_launcher.launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }catch(err){
      alert(context:context, title:'', message:SharedStrings.canLaunchThisURL);
    }
  }

  static Future launchInNonBrowser(BuildContext context, String url)async{
    try{
      await url_launcher.launchUrl(Uri.parse(url), mode: LaunchMode.externalNonBrowserApplication);
    }catch(err){
      alert(context:context, title:'', message:SharedStrings.canLaunchThisURL);
    }
  }

  static openDialPad(BuildContext context, String phoneNumber) async {
    Uri url = Uri(scheme: "tel", path: phoneNumber);
    if (await url_launcher.canLaunchUrl(url)) {
      await url_launcher.launchUrl(url);
    } else {
      alert(context:context, title:'', message:SharedStrings.invalidCallingNumber);
    }
  }
}