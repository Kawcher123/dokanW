import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/use_cases/login_usecase.dart';
import 'package:dokan/domain/use_cases/user_local_usecase.dart';
import 'package:dokan/presentation/common_ui/ui.dart';
import 'package:dokan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final LoginUseCase loginUseCase;
  final UserLocalUseCase userLocalUseCase;

  LoginController({required this.loginUseCase,required this.userLocalUseCase});

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final passObscure = false.obs;
  late String username;
  late String password;
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



  Future<void> login() async {
    Ui.commonUi.customDialogLoader();
    final result = await loginUseCase.login(username, password);
    result.fold(
          (failure) {

        if (failure is CacheFailure) {
          print('Cache Error: ${failure.message}');
        } else if (failure is ServerFailure) {
          print('Server Error: ${failure.message}');
        } else {
          print('Unknown Error');
        }
      },
          (resp) {
            print('LoginController.login:${resp.token}');
            print('LoginController.login:${resp.id}');
            userLocalUseCase.saveUserDataLocally(resp);
           Get.offAllNamed(Routes.ROOT);
      },
    );
  }
}
