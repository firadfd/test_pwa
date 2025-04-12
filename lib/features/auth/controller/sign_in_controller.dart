import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var isSignUpSelected = true.obs;
  var selectedCountryCode =
      CountryCode(
        code: 'FR',
        dialCode: '+33',
        name: 'France',
        flagUri: 'flags/fr.png',
      ).obs; // Initialize with France
  var phoneNumber = ''.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool isLoading = false.obs;

  void updateCountryCode(CountryCode countryCode) {
    selectedCountryCode.value = countryCode;
  }

  void clearPhoneNumber() {
    phoneController.clear();
    phoneNumber.value = '';
  }

  // Example: Get the full phone number with country code
  String getFullPhoneNumber() {
    return '${selectedCountryCode.value.dialCode}${phoneNumber.value}';
  }

  @override
  void onClose() {
    super.onClose();
  }
}
