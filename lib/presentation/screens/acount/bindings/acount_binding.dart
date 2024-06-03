import 'package:get/get.dart';

import '../controllers/acount_controller.dart';

class AcountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcountController>(
      () => AcountController(),
    );
  }
}
