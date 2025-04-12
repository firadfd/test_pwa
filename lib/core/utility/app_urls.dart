class AppUrls {
  static const String _baseUrl = 'https://ceofrb-backend.vercel.app/api/v1';
  static const String registerUrl = '$_baseUrl/users/create';

  static const String loginUrl = '$_baseUrl/auth/login';
  static const String send_otp = '$_baseUrl/auth/send-otp';
  static const String verify_otp = '$_baseUrl/auth/verify-otp';
  static const String update_location = '$_baseUrl/auth/update/location';
  static const String updateUser = '$_baseUrl/users/';
  static const String user = '$_baseUrl/auth/profile';
  static const String updatePassengerDoccument = '$_baseUrl/auth/update/passenger-document';
  static const String updateProfilePicture = '$_baseUrl/auth/update/profile-image';
  static const String orderType = '$_baseUrl/booking/passengers';
  static const String updateOrder = '$_baseUrl/booking/status-update';

  //TODO: Payment url will be change
  static const plan = "$_baseUrl/plans";
  static const payment = "$_baseUrl/payments";

}
