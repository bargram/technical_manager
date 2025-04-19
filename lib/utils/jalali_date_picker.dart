import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as date_picker;
import 'package:persian_datetime_picker/persian_datetime_picker.dart';


class JalaliDatePicker {

  Future<DateTime?> pickJalaliDate(BuildContext context)async{
    date_picker.Jalali? datePicker = await date_picker.showPersianDatePicker(
      context: context,
      initialDate: date_picker.Jalali.now(),
      firstDate: date_picker.Jalali(1385, 8),
      lastDate: date_picker.Jalali(1450, 9),
    );
    if(datePicker == null){
      return null;
    }
    return DateTime.parse(datePicker.toJalaliDateTime());
  }

  Future<Gregorian?> pickJalaliGeorgianDate(BuildContext context)async{
    date_picker.Jalali? datePicker = await date_picker.showPersianDatePicker(
      context: context,
      initialDate: date_picker.Jalali.now(),
      firstDate: date_picker.Jalali(1385, 8),
      lastDate: date_picker.Jalali(1450, 9),
    );
    if(datePicker == null){
      return null;
    }
    return datePicker.toGregorian();
  }

  Future<DateTime?> pickGeorgianDate(BuildContext context)async{
    date_picker.Jalali? datePicker = await date_picker.showPersianDatePicker(
      context: context,
      initialDate: date_picker.Jalali.now(),
      firstDate: date_picker.Jalali(1385, 8),
      lastDate: date_picker.Jalali(1450, 9),
    );
    if(datePicker == null){
      return null;
    }
    return datePicker.toDateTime();
  }

  Future<TimeOfDay?> pickTime(BuildContext context, String helpText)async{
    var timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: helpText,
    );
    if(timePicker == null){
      return null;
    }
    return timePicker;
  }
}