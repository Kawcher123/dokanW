import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),

      ),
      backgroundColor: Get.theme.primaryColor,
        onPressed: () {},
        child:  Icon(
          CupertinoIcons.search,
          color: Get.theme.cardColor,
        ));
  }
}
