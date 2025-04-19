




String addZeroToSingleDigitNumber(String value){
  if(value.length == 1){
    return '0$value';
  }
  return value;
}