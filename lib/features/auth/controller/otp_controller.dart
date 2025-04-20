import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/shared_prefarenses_helper.dart';

class OTPController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  final TextEditingController otpController = TextEditingController();
  var otp = ''.obs;
  var phoneNumber = ''.obs;
  var isSignUp = true.obs;
  var id = ''.obs;
  RxBool isLoading = false.obs;

  void setOtp(String value) {
    otp.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      var data = Get.arguments;
      phoneNumber.value = data['phoneNumber'] ?? '';
      id.value = data['id'] ?? '';
      isSignUp.value = data['isSignUp'] ?? true;
    } else {
      print("Error: Get.arguments is null");
    }
  }

  void clearOtp() {
    otp.value = '';
    otpController.clear();
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
