import 'package:get/get.dart';

import '../widgets/redemption_dialog.dart';

class StampDetailsController extends GetxController {
  void showDialogue() {
    Get.dialog(RedemptionDialog());
  }
}

