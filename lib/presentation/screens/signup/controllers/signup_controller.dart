import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:dokan/domain/use_cases/signup_usecase.dart';
import 'package:dokan/presentation/common_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final SignupUSeCase signupUSeCase;

  SignupController({required this.signupUSeCase});
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final passObscure = false.obs;
  final confirmPassObscure = false.obs;

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  late String username;
  late String email;
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


  Future<void> signup()async{
Ui.commonUi.customDialogLoader();
    final result= await signupUSeCase.signup(username,email,password);
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
            if(resp)
              {
                Ui.commonUi.showAwesomeDialog('Success', 'Registration successful', Colors.green
                    , () {
                  Get.back();
                  Get.back();
                  Get.back();
                    }, Get.context, onTapClose: (){},type: 'success');
              }
            else
              {
                Ui.commonUi.showAwesomeDialog('Error', 'Failed to register new user', Colors.red
                    , () {
                      Get.back();
                      Get.back();
                    }, Get.context, onTapClose: (){},type: 'error');
              }

      },
    );
  }

}
