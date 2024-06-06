import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/entities/user_entity.dart';
import 'package:dokan/domain/use_cases/update_usecase.dart';
import 'package:dokan/domain/use_cases/user_local_usecase.dart';
import 'package:dokan/presentation/common_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcountController extends GetxController {
  //TODO: Implement AcountController

  final UserLocalUseCase userLocalUseCase;
  final UpdateUserUseCase updateUserUseCase;
  AcountController({required this.userLocalUseCase, required this.updateUserUseCase});

  final isAccountExpanded = false.obs;

  Rx<UserEntity?> userData = UserEntity().obs;

  late String name;
  late String email;
  late String nickname;

  GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    userData.value = userLocalUseCase.getUserData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> updateUser() async {
    Ui.commonUi.customDialogLoader();
    final result = await updateUserUseCase.updateUserData(name, email, nickname);

    result.fold(
      (failure) {
        if (failure is CacheFailure) {
          print('Cache Error: ${failure.message}');
          Ui.commonUi.showAwesomeDialog('Error', "Failed to update data.", Colors.green, () {}, Get.context, onTapClose: () {
            Get.back();
            Get.back();
          }, type: 'error');
        } else if (failure is ServerFailure) {
          print('Server Error: ${failure.message}');
          Ui.commonUi.showAwesomeDialog('Error', "Failed to update data.", Colors.green, () {}, Get.context, onTapClose: () {
            Get.back();
            Get.back();
          }, type: 'error');
        } else {
          print('Unknown Error');
          Ui.commonUi.showAwesomeDialog('Error', "Failed to update data.", Colors.green, () {}, Get.context, onTapClose: () {
            Get.back();
            Get.back();
          }, type: 'error');
        }
      },
      (resp) {
        print('LoginController.login:${resp.token}');
        print('LoginController.login:${resp.id}');
         saveUpdatedDataInLocally(resp);
          Ui.commonUi.showAwesomeDialog('Success', "User data updated successfully.", Colors.green, () {
            Get.back();
            Get.back();
          }, Get.context, onTapClose: () {

          }, type: 'success');

      },
    );
  }

  void saveUpdatedDataInLocally(UserEntity resp) {
      String? token =userLocalUseCase.getUserData()?.token;
    UserEntity userEntity=UserEntity(
      id: resp.id,
      name: resp.name,
      email: resp.email,
      token: token,
    );
     userLocalUseCase.saveUserDataLocally(userEntity);
      userData.value = userLocalUseCase.getUserData();
  }
}
