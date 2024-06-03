import 'package:dokan/presentation/global_widget/block_button_widget.dart';
import 'package:dokan/presentation/global_widget/image_widget.dart';
import 'package:dokan/presentation/global_widget/text_field_widget.dart';
import 'package:dokan/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
   LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: controller.signInFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(
                  height: size.height*0.2,
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageWidget(
                    imageUrl: 'assets/logo.jpg',
                    height:  size.width*0.35,
                    width: size.width*0.35,
                    imageBoxFit: 'contain',
                    isNetworkImage: false,
                  ),
                ),
                SizedBox(
                  height: size.height*0.01,
                ),
                const Text(
                  'Sign in to your account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height*0.01,
                ),




                TextFieldWidget(
                  keyboardType: TextInputType.phone,
                  isFill: true,
                  fillColor: Get.theme.cardColor,
                  hintText: 'Email',
                  labelText: '',
                  initialValue: '',
                  onChanged: (v) {

                  },
                  prefix: const Icon(CupertinoIcons.mail),
                  validator: (v) {
                    return v!=null&&v.isEmpty ? 'This field cannot be empty' :v!.length < 11 || v.length > 11?'Invalid phone number': null;
                  },
                ),

                Obx(() => TextFieldWidget(
                  keyboardType:  TextInputType.phone,
                  isFill: true,
                  fillColor: Get.theme.scaffoldBackgroundColor,
                  labelText: '',
                  hintText: 'Enter your password',
                  onChanged: (v) {
                    controller.password = v;
                  },
                  validator: (v) {
                    return v!.isEmpty
                        ? 'This field cannot be empty'
                        : v.length!=4
                        ? 'PIN must have 4 digits.'
                        :!v.isNumericOnly
                        ?'PIN should contain numeric value only.'
                        : null;
                  },
                  obscureText: controller.passObscure.value,
                  iconData: Icons.lock_outline,
                  prefix: const Icon(CupertinoIcons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.passObscure.value = !controller.passObscure.value;
                    },
                    icon: Icon(controller.passObscure.value ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                  ),
                )),

                SizedBox(
                  height: size.height*0.07,
                ),
                BlockButtonWidget(
                  onPressed: () {
                   Get.toNamed(Routes.ROOT);
                    // if(controller.signInFormKey.currentState!.validate())
                    // {
                    //
                    // }
                  },
                  height: size.width*0.15,
                  width: size.width,
                  color: Get.theme.primaryColor,
                  radius: 10,
                  child:  Text(
                    'Sign in',
                    style: TextStyle(
                      color: Get.theme.cardColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.03,
                ),
                GestureDetector(
                  onTap: () {
                  Get.offAllNamed(Routes.SIGNUP);
                  },
                  child: SizedBox(
                    height: size.height*0.06,

                    child: const Text(
                      "Create new account",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
