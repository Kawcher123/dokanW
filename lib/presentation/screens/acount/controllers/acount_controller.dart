import 'package:dokan/domain/use_cases/user_local_usecase.dart';
import 'package:get/get.dart';

class AcountController extends GetxController {
  //TODO: Implement AcountController

  final UserLocalUseCase userLocalUseCase;
  AcountController({required this.userLocalUseCase});
  final isAccountExpanded = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



}
