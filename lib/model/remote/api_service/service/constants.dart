class ApiConstants
{
  static const String baseUrlForImages = 'https://68e5-45-246-128-70.ngrok-free.app';
  static const String baseUrl = '$baseUrlForImages/api/v1/';

  // timeout durations
  static Duration timeoutDuration = const Duration(seconds: 15);

  // Auth
  static const String login = 'login';
  static const String signUp = 'register';
  static const String forgotPassword = 'password/forget_password';
  static const String sendCode = 'password/otp_password';
  static const String resetPassword = 'password/reset_password';
  static const String refreshToken = 'refresh';
  static const String logout = 'logout';

}