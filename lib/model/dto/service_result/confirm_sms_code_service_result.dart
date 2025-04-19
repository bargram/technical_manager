
class ConfirmSMSCodeServiceResult {
  //defaults for service results
  bool tokenExp;
  bool success;
  bool connection;
  bool showMessage;
  String? message;

  //custom
  String? token;
  Map? userInfo;

  //constructor
  ConfirmSMSCodeServiceResult({
    required this.tokenExp,
    required this.success,
    required this.connection,
    required this.showMessage,
    this.message,
    this.token,
    this.userInfo,
  });
}
