import 'package:dokan/presentation/screens/acount/views/acount_view.dart';
import 'package:dokan/presentation/screens/home/views/home_view.dart';
import 'package:dokan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement RootController
  final selectedIndex = 0.obs;
  final categoryDataLoaded = false.obs;

  late AnimationController fabAnimationController;


  var bottomNavbarItems = [
    {'title': 'Home', 'icon': 'assets/bottom/home.png'},
    {'title': 'Categories', 'icon': 'assets/bottom/dashboard.png'},
    {'title': 'Cart', 'icon': 'assets/bottom/cart.png'},
    {'title': 'Account', 'icon': 'assets/bottom/user.png'},
  ];
  List<Widget> pages = [
    const HomeView(),
    Container(),
    Container(),
    AcountView(),
  ];
  @override
  void onInit() {
    super.onInit();
    fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Widget get currentPage => pages[selectedIndex.value];

}
