import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget({
    Key? key,
    this.color,
    this.child,
    this.width,
    this.height,
    this.isBlur = true,
    this.radius,
    this.hasBorder = false,
    this.hasShadow = false,
    this.onPressed,
  }) : super(key: key);

  final Color? color;
  final Widget? child;
  final double? radius;
  final double? width;
  final double? height;
  final bool? isBlur;
  final bool? hasBorder;
  final bool hasShadow;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      height: height ?? 50,
      decoration: BoxDecoration(
        border: hasBorder == true
            ? Border.all(
                width: 2,
                color: Get.theme.primaryColor,
              )
            : Border.all(color: Colors.transparent),
        color: color ?? Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
        boxShadow: [
          BoxShadow(
            color:hasShadow? Colors.grey.withOpacity(0.2):Get.theme.cardColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 0),
        //color: color,
        disabledElevation: 0,
        disabledColor: Theme.of(context).disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 30),
        ),
        elevation: 0,
        child: child,
      ),
    );
  }
}
