import 'package:get/get.dart';

class CustomDropDownController extends GetxController {
  // Observable selected items
  var selectedGender = Rx<String?>(null);
  var selectedVehicle = Rx<String?>(null);

  // Set the selected gender
  void setSelectedGender(String? value) {
    selectedGender.value = value;
  }

  // Set the selected vehicle
  void setSelectedVehicle(String? value) {
    selectedVehicle.value = value;
  }
}

