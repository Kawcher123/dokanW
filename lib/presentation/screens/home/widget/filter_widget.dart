import 'package:dokan/presentation/screens/home/controllers/home_controller.dart';
import 'package:dokan/presentation/screens/home/widget/filter_bottom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductFilterWidget extends GetWidget<HomeController> {
  const ProductFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            builder: (BuildContext context) {
              return FilterBottomSheetWidget();
            });
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.filter_list, color: Get.theme.disabledColor),
                SizedBox(width: Get.size.width * 0.02),
                Text(
                  'Filter',
                  style: TextStyle(fontSize: 16.0, color: Get.theme.disabledColor),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Sort By',
                  style: TextStyle(fontSize: 16.0, color: Get.theme.disabledColor),
                ),
                SizedBox(width: Get.size.width * 0.02),
                Icon(Icons.arrow_drop_down, color: Get.theme.disabledColor),
                SizedBox(width: Get.size.width * 0.02),
                Icon(Icons.sort, color: Get.theme.disabledColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
