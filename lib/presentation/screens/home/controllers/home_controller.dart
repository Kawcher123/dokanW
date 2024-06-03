import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxMap<String, bool> filterOptions = {
    'Newest': false,
    'Oldest': false,
    'Price Low>High': false,
    'Price High>Low': false,
    'Best Selling': false,
  }.obs;
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
