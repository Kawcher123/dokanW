
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dokan/infrastructure/common_services/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class Ui {
  static Ui? _commonUi;

  Ui._();

  static Ui get commonUi => _commonUi ??= Ui._();
   SnackBar successAwesomeSnackBar({String title = 'Success', required String message}) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.success,
      ),
    );
  }

   SnackBar errorAwesomeSnackBar({String title = 'Something went wrong!', required String message}) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.failure,
      ),
    );
  }

   SnackBar warningAwesomeSnackBar({String title = 'Something went wrong!', required String message}) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.warning,
      ),
    );
  }

   BoxDecoration getBoxDecoration({
    Color? color,
    Color? shadowColor,
    double? radius,
    Border? border,
    Gradient? gradient,
  }) {
    return BoxDecoration(
      color: color ?? Get.theme.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      border: border ?? Border.all(color: Get.theme.dividerColor),
      boxShadow: [
        BoxShadow(color: shadowColor!, blurRadius: 10, offset: const Offset(0, 5)),
      ],
      gradient: gradient,
    );
  }

   BoxDecoration getBoxDecorationImage(
      {Color? color, double? radius, bool? isLocal = false, Border? border, Gradient? gradient, String image = ''}) {
    return BoxDecoration(
      color: color ?? Get.theme.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      boxShadow: [
        BoxShadow(color: Get.theme.primaryColor.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5)),
      ],
      border: border ?? Border.all(color: Get.theme.primaryColor.withOpacity(0.05)),
      gradient: gradient,
      image: DecorationImage(
          image: CachedNetworkImageProvider(
            image,
          ),
          fit: BoxFit.cover),
    );
  }

   BoxFit getBoxFit(String boxFit) {
    switch (boxFit) {
      case 'cover':
        return BoxFit.cover;
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'none':
        return BoxFit.none;
      case 'scale_down':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

   AlignmentDirectional getAlignmentDirectional(String alignmentDirectional) {
    switch (alignmentDirectional) {
      case 'top_start':
        return AlignmentDirectional.topStart;
      case 'top_center':
        return AlignmentDirectional.topCenter;
      case 'top_end':
        return AlignmentDirectional.topEnd;
      case 'center_start':
        return AlignmentDirectional.centerStart;
      case 'center':
        return AlignmentDirectional.topCenter;
      case 'center_end':
        return AlignmentDirectional.centerEnd;
      case 'bottom_start':
        return AlignmentDirectional.bottomStart;
      case 'bottom_center':
        return AlignmentDirectional.bottomCenter;
      case 'bottom_end':
        return AlignmentDirectional.bottomEnd;
      default:
        return AlignmentDirectional.bottomEnd;
    }
  }

   CrossAxisAlignment getCrossAxisAlignment(String textPosition) {
    switch (textPosition) {
      case 'top_start':
        return CrossAxisAlignment.start;
      case 'top_center':
        return CrossAxisAlignment.center;
      case 'top_end':
        return CrossAxisAlignment.end;
      case 'center_start':
        return CrossAxisAlignment.center;
      case 'center':
        return CrossAxisAlignment.center;
      case 'center_end':
        return CrossAxisAlignment.center;
      case 'bottom_start':
        return CrossAxisAlignment.start;
      case 'bottom_center':
        return CrossAxisAlignment.center;
      case 'bottom_end':
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }


   List<Icon> getStarsList(double rate, {double size = 18}) {
    var list = <Icon>[];
    list = List.generate(rate.floor(), (index) {
      return Icon(Icons.star, size: size, color: Color(0xFFFFB24D));
    });
    if (rate - rate.floor() > 0) {
      list.add(Icon(Icons.star_half, size: size, color: Color(0xFFFFB24D)));
    }
    list.addAll(List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
      return Icon(Icons.star_border, size: size, color: Color(0xFFFFB24D));
    }));
    return list;
  }

   Widget getPrice(double myPrice, {TextStyle? style, String zeroPlaceholder = '-', String? unit}) {
    if (style != null) {
      style = style.merge(TextStyle(fontSize: style.fontSize!));
    }
    try {
      if (myPrice == 0) {
        return Text('-', style: style ?? Get.textTheme.titleSmall);
      }
      return RichText(
        softWrap: false,
        overflow: TextOverflow.fade,
        maxLines: 1,
        text: TextSpan(
          text: '',
          style: getPriceStyle(style!),
          children: <TextSpan>[
            if (unit != null) TextSpan(text: " $unit ", style: getPriceStyle(style)),
            TextSpan(text: myPrice.toStringAsFixed(2) ?? '', style: style),

          ],
        ),
      );
    } catch (e) {
      return const Text('');
    }
  }

   TextStyle? getPriceStyle(TextStyle? style) {
    if (style == null) {
      return Get.textTheme.subtitle2?.merge(
        TextStyle(fontWeight: FontWeight.w300, fontSize: Get.textTheme.subtitle2!.fontSize! - 4),
      );
    } else {
      return style.merge(TextStyle(fontWeight: FontWeight.w300, fontSize: style.fontSize! - 4));
    }
  }

   Widget customLottieLoader() {
    return const Center(
      child: Image(
        image: AssetImage(
          'assets/loading.gif',
        ),
      ),
    );
  }

  Widget customLoader() {
    return  SpinKitDoubleBounce(
      color: Get.theme.primaryColor,
    );
  }
   Widget customBottomLoader() {
    return SpinKitDoubleBounce(
      size: 30,
      color: Get.theme.primaryColor,
    );
  }
  Widget customBackIcon({VoidCallback? onPress, Color? color}) {
    return IconButton(
        onPressed: onPress,
        icon: Icon(
          Icons.arrow_back_ios,
          color: color!,
        ));
  }
   customDialogLoader() {
    return Get.dialog(SpinKitDoubleBounce(
      color: Get.theme.primaryColor,
    ));
  }
  Widget customSmallBox({double? size,double? height, Color? color, Widget? child, double? radius}) {
    return Container(
      width: size,
      height:height?? size,
      decoration: BoxDecoration(color: color!, borderRadius: BorderRadius.circular(radius ?? 30)),
      child: Center(child: child),
    );
  }



  Widget noDataFound(context, {String title = 'No data found', String url = 'assets/noData.json'}) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Lottie.asset(url),
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).disabledColor,
            ),
          ),
        )
      ],
    );
  }


   Widget shimmerLoader({double? width = 200,double? radius, double? height = 100, Color? baseColor, Color? highlightColor}) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Get.theme.cardColor,
      highlightColor: highlightColor ?? Get.theme.cardColor.withOpacity(0.4),
      child: Container(
          height: height,
          width: width,
          decoration: getBoxDecoration(
            color: Get.theme.cardColor,
            radius: radius,
          )),
    );
  }

   Widget cardWithText({
    double radius = 5,
    required Color color,
    required Color textColor,
    Color borderColor = Colors.white,
    required String title,
    required double hP,
    required double vP,
    required VoidCallback onPress
  }) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: getBoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor,
            ),
            radius: radius),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }


}
