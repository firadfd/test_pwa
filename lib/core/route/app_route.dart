import 'package:get/get.dart';
import 'package:test_pwa/features/main/screen/main_view.dart';
import 'package:test_pwa/features/stamp/screen/stamp_details_screen.dart';

import '../../features/auth/screen/otp_screen.dart';
import '../../features/auth/screen/sign_in_screen.dart';

class AppRoute {
  static const String signin = '/SigninScreen';
  static const String otp = '/OtpScreen';
  static const String mainView = '/MainView';
  static const String stampDetails = '/StampDetails';

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
      name: mainView,
      page: () => MainView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: stampDetails,
      page: () => StampDetailsScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
