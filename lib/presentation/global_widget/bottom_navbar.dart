
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dokan/presentation/screens/root/controllers/root_controller.dart';
import 'package:dokan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarWidget extends GetWidget<RootController> {

  const BottomNavBarWidget({super.key,});



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(() => Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: AnimatedBottomNavigationBar.builder(
        height: size.width * .18,
        notchMargin: 4.0,
        hideAnimationController: controller.fabAnimationController,
        activeIndex: controller.selectedIndex.value,
        gapLocation: GapLocation.center,
        backgroundColor:Get.theme.cardColor,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) {
          if(index==3 && controller.userLocalUseCase.getUserData()==null)
          {
            Get.toNamed(Routes.LOGIN);
          }
          else
          {
            controller.selectedIndex.value=index;

          }

        },
        tabBuilder: (int index, bool isActive) {
          return InkResponse(
            onTap: () {
              if(index==3 && controller.userLocalUseCase.getUserData()==null)
              {
                Get.toNamed(Routes.LOGIN);
              }
              else
              {
                controller.selectedIndex.value=index;

              }


              },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image.asset(
                  controller.bottomNavbarItems[index]['icon']!,
                  height: 25,
                  width: 25,
                  color: controller.selectedIndex.value == index ? Get.theme.primaryColor : Get.theme.disabledColor,
                ),
                // Text(
                //   controller.bottomNavbarItems[index]['title']!,
                //   style: TextStyle(
                //     color: controller.selectedIndex.value == index ? Get.theme.primaryColor : Get.theme.disabledColor,
                //   ),
                // ),
              ],
            ),
          );
        },
        itemCount: 4,
      ),
    ));
  }
}
