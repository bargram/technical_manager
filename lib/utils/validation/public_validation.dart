



import 'package:flutter/material.dart';

import '../../view/widget/shared/alert.dart';
import '../shared_strings.dart';
import '../string_is_empty.dart';

class PublicValidation{


  bool text(BuildContext context, String value, String message){
    if(stringIsEmpty(value)){
      alert(context:context, title:SharedStrings.validationError, message:message, isError:true);
      return false;
    }
    return true;
  }

  bool boolean(BuildContext context, bool value, String message){
    if(value == false){
      alert(context:context, title:SharedStrings.validationError, message:message, isError:true);
      return false;
    }
    return true;
  }

  bool textWithLength(BuildContext context, String value, String message, int length){
    if(stringIsEmpty(value) || value.length < length){
      alert(context:context, title:SharedStrings.validationError, message:message, isError:true);
      return false;
    }
    return true;
  }

  bool list(BuildContext context, int length, String message){
    if(length == 0){
      alert(context:context, title:SharedStrings.validationError, message:message, isError:true);
      return false;
    }
    return true;
  }
}