


import 'package:dokan/presentation/global_widget/block_button_widget.dart';
import 'package:dokan/presentation/screens/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheetWidget extends GetWidget<HomeController> {
  FilterBottomSheetWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/img/rectline.png',
              height: 20,
              width: 40,
              color: Get.theme.disabledColor.withOpacity(0.2),
            ),
            SizedBox(
              height: Get.size.width * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Get.theme.disabledColor.withOpacity(0.1),
              ),
            ),
            SizedBox(
              height: Get.size.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Filter',style: Get.theme.textTheme.displaySmall,),
              ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: controller.filterOptions.keys.map((String key) {
                      return Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: controller.filterOptions[key],
                            onChanged: (bool? value) {
                              controller.filterOptions[key]=value??false;

                            },
                          ),
                          SizedBox(width: Get.size.width*0.02),// Adjust the width to control the gap between checkbox and text
                          Text(key),
                        ],
                      ));
                    }).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     BlockButtonWidget(
                       color: Get.theme.cardColor,
                       onPressed: ()
                       {
                       Get.back();
                       },
                     radius: 10,
                       hasShadow: true,
                       width: Get.size.width*0.3,
                       child: Text('Cancel',style: TextStyle(
                         color: Get.theme.primaryColor,
                       ),),
                     ),

                      BlockButtonWidget(
                        color: Get.theme.primaryColor,
                        onPressed: ()
                        {
                          Get.back();
                        },
                        radius: 10,
                        hasShadow: true,
                        width: Get.size.width*0.3,
                        child: Text('Apply',style: TextStyle(
                          color: Get.theme.cardColor,
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
