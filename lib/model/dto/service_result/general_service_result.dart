

class GeneralServiceResult{
  //defaults for service results
  bool tokenExp;
  bool success;
  bool connection;
  bool showMessage;
  String? message;
  String? redirectPageName;
  bool? hasMoreData;

  //custom
  dynamic data;

  //constructor
  GeneralServiceResult({
    required this.tokenExp,
    required this.success,
    required this.connection,
    required this.showMessage,
    this.message,
    this.data,
    this.redirectPageName,
    this.hasMoreData,
  });
}


