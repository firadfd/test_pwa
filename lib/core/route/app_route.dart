import 'package:get/get.dart';

import '../../features/auth/screen/otp_screen.dart';
import '../../features/auth/screen/sign_in_screen.dart';
import '../../features/setting/screen/setting_qr_screen.dart';

class AppRoute {
  static const String signin = '/SigninScreen';
  static const String otp = '/OtpScreen';
  static const String settingQR = '/SettingQR';

  static final route = [

    GetPage(
      name: signin,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: otp,
      page: () => OtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: settingQR,
      page: () => SettingQRScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
