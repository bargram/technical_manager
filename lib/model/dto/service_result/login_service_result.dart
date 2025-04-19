



class LoginServiceResult {

  //defaults for service results
  bool success;
  bool connection;
  bool showMessage;
  String? message;

  //custom
  String? otpCode;
  bool? twoFactorEnabled;
  String? token;
  String? redirectPageName; // redirecting to destination page

  //constructor
  LoginServiceResult({
    required this.success,
    required this.connection,
    required this.showMessage,
    required this.redirectPageName,
    this.otpCode,
    this.message,
    this.twoFactorEnabled,
  });

}
