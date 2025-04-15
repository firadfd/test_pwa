import 'package:get/get.dart';

import '../../features/auth/controller/otp_controller.dart';
import '../../features/auth/controller/sign_in_controller.dart';
import '../../features/main/controller/main_view_controller.dart';
import '../../features/stamp/controller/stamp_details_controller.dart';
import '../../features/stamp/controller/stamp_tab_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainViewController(),fenix: true);
    Get.lazyPut(() => OTPController(),fenix: true);
    Get.lazyPut(() => SignInController(),fenix: true);
    Get.lazyPut(() => StampTabController(),fenix: true);
    Get.lazyPut(() => StampDetailsController(),fenix: true);
  }
}
