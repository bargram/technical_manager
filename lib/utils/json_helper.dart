
import 'dart:convert';
import 'logger.dart';

// using for json parsing
class JsonHelper{
  static Future<Map> convertResponseToJson(dynamic response)async{
    if(response.runtimeType.toString() == '_Map<String, dynamic>' || response.runtimeType.toString() == '_JsonMap'){
      return response;
    }
    Map result;
    try {
      result = await jsonDecode(response.toString());
    }catch(e){
      // final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
      // pattern.allMatches(response.toString()).forEach((match) => print(match.group(0)));
      // Logger.consolePrint("$e \n $response");
      return {};
    }
    // Logger.consolePrint("success converting\n$result");
    return result;
  }
}