import 'dart:async';
import 'package:get/get.dart';

class RedeemDialogueController extends GetxController {
  var countdown = 30.obs;
  var redemptionCode = "23064".obs;

  Timer? _timer;

  @override
  void onInit() {
    startCountdown();
    super.onInit();
  }

  void startCountdown() {
    countdown.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void closeDialog() {
    _timer?.cancel();
    Get.back();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
