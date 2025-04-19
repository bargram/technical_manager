


String addCommaToNumber(dynamic _num){
  String num = _num.toString();
  if(num == 'null') return 'null';
  List parts = [];
  String temp1 = '';
  for(int j = num.length-1;j>=0;j--){
    temp1 += num[j];
  }
  num = temp1;
  for(int i = 0;i<=num.length-1;i++){
    parts.add(num[i]);
    if((i+1) % 3 == 0){
      parts.add(',');
    }
  }
  String temp2 = '';
  for(int i = parts.length-1;i>=0;i--){
    temp2 += parts[i];
  }
  if(temp2[0] == ',') temp2 = temp2.replaceFirst(',', '');
  return temp2;
}