import 'package:dokan/presentation/global_widget/bottom_navbar.dart';
import 'package:dokan/presentation/global_widget/floating_action_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      //
        extendBody: true,
        body:
        controller.currentPage,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatingActionButtonWidget(),
        bottomNavigationBar: const BottomNavBarWidget(
        )));
  }
}
