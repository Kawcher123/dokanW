import 'package:dokan/presentation/global_widget/product_card_widget.dart';
import 'package:dokan/presentation/screens/home/widget/filter_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title: const Text('Product List'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}
              , icon: const Icon(CupertinoIcons.search
              ))
        ],
      ),
      body: ListView(
        primary: true,
        children: [
          const ProductFilterWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the GridView
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                childAspectRatio: 0.65,
              ),
              itemCount: 6, // Number of items in the GridView
              itemBuilder: (context, gridIndex) {
                return const ProductCardWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
