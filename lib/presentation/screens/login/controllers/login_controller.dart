import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final passObscure = false.obs;
  String? phone;
  String? password;
  final countryCode = 'bd +880'.obs;
  TextEditingController phoneNumberController = TextEditingController();
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
