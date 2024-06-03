/*
 * Copyright (c) 2020 .
 */

import 'package:dokan/presentation/screens/acount/controllers/acount_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountLinkWidget extends GetWidget<AcountController> {
  final Icon? icon;
  final Widget? text;
  final VoidCallback? onTap;

  const AccountLinkWidget({
    super.key,
    this.icon,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            icon!,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: 1,
              height: 24,
              color: Get.theme.primaryColor.withOpacity(0.3),
            ),
            Expanded(
              child: text!,
            ),
            Obx(() => Icon(
              controller.isAccountExpanded.isTrue?Icons.keyboard_arrow_down:Icons.arrow_forward_ios,
              size: 18,
              color: Get.theme.focusColor,
            )),
          ],
        ),
      ),
    );
  }
}
