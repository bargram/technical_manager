import 'dart:io';



//using for log detail in debug mode
class Logger {

  static consolePrint(dynamic input){
    print('\n================================\n');
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(input.toString()).forEach((match) => print(match.group(0)));
    print('==================================\n\n');
  }


}
