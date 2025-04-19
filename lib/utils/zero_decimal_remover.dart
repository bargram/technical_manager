


String zeroDecimalRemover(String value){
  String temp = '';
  for(int i=0; i<value.length; i++){
    if(value[i] == '.') break;
    temp += value[i];
  }

  return temp;

}