import 'package:dokan/presentation/global_widget/image_widget.dart';
import 'package:dokan/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_ui/ui.dart';

class ProductCardWidget extends StatelessWidget {

  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Get.theme.dividerColor.withOpacity(0.02), blurRadius: 2, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            child: ImageWidget(
              imageUrl: 'assets/logo.jpg',
              isNetworkImage: false,
              height: Get.size.width*0.42,
              width: Get.size.width,
              imageBoxFit: 'cover',
            ),
          ),
          Container(
            height: Get.size.height*0.12,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Get.theme.cardColor,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                   'abc',
                  maxLines: 2,
                  style: Get.textTheme.bodyMedium?.merge(TextStyle(color: Get.theme.hintColor)),
                ),

                Wrap(
                  spacing: 5,
                  alignment: WrapAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [

                    Row(
                      children: [
                        Ui.commonUi.getPrice(
                          2000,
                          style: Get.textTheme.bodyMedium?.merge(
                            TextStyle(
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          unit: currency,
                        ),
                        // _product.discountPrice != null
                        //     ? Ui.getPrice(
                        //   _product.discountPrice.toDouble(),
                        //   style: Get.textTheme.bodyText2.merge(TextStyle(color: Get.theme.accentColor)),
                        //   unit: '',
                        // )
                        //     : const Wrap(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  children: Ui.commonUi.getStarsList(5.0),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
