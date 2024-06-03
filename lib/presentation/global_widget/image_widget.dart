import 'package:cached_network_image/cached_network_image.dart';
import 'package:dokan/presentation/common_ui/ui.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final String? imageBoxFit;
  final String? placeHolder;
  final bool isNetworkImage;
  const ImageWidget({
    super.key,
   required this.imageUrl,
    this.height,
    this.width,
    this.imageBoxFit,
    this.placeHolder,
    required this.isNetworkImage,
  });

  @override
  Widget build(BuildContext context) {
    return isNetworkImage
        ?  CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            height: height!,
            width: width!,
            fit: Ui.commonUi.getBoxFit(imageBoxFit ?? 'cover'),
            placeholder: (context, url) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image(
                image: AssetImage(placeHolder ??  'assets/img/loading.gif',),
                fit: Ui.commonUi.getBoxFit(imageBoxFit ?? 'contain'),
              ),
            ),
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image(
                image: AssetImage(
                  placeHolder ??  'assets/img/loading.gif',
                ),
                fit: Ui.commonUi.getBoxFit(imageBoxFit ?? 'cover'),
              ),
            ),
          )
        : Image.asset(
          imageUrl,
          height: height,
          width: width,
          fit: Ui.commonUi.getBoxFit(imageBoxFit??'cover'),
        );
  }
}
