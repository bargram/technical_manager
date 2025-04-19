


String convertPersianNumbersToEnglish(String text){
  text = text.replaceAll('۰', '0');
  text = text.replaceAll('۱', '1');
  text = text.replaceAll('۲', '2');
  text = text.replaceAll('۳', '3');
  text = text.replaceAll('۴', '4');
  text = text.replaceAll('۵', '5');
  text = text.replaceAll('۶', '6');
  text = text.replaceAll('۷', '7');
  text = text.replaceAll('۸', '8');
  text = text.replaceAll('۹', '9');
  return text;
}