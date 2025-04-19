

import 'package:bargram_technical_manager/utils/shared_strings.dart';

bool stringIsEmpty(String string){
  if(string == '' || string == ' '||string == 'null'){
    return true;
  }
  return false;
}


String handleNullValue(String value){
  if(value == 'null'){
    return SharedStrings.unknown;
  }
  return value;
}