import 'package:dokan/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.width,
    this.height,
    this.textcontroller,
    this.ontap,
    this.oneditingComplete,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefix,

    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
    this.suffix,
    this.limit,
    this.maxline = 1,
    this.isFill = false,
    this.fillColor = Colors.transparent,
    this.readOnly,
    this.hasBorder=false,
    this.radius,

  }) : super(key: key);

  final double? width;
  final double? height;
  final TextEditingController? textcontroller;
  final VoidCallback? ontap;
  final VoidCallback? oneditingComplete;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool obscureText;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final int? limit;
  final double? radius;
  final int? maxline;
  final bool? isFill;
  final Color? fillColor;
  final bool? readOnly;
  final bool? hasBorder;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(labelText!=null||labelText!='')
        Text(
          labelText??'',
          style:  TextStyle(
            fontSize: 16,
            color: Get.theme.disabledColor,
          ),
        ),
        if(labelText!=null||labelText!='')
        SizedBox(height: size.height*0.008,),
        Container(
          height: size.width*0.15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color:hasBorder==true?Get.theme.cardColor: Get.theme.dividerColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: TextFormField(
              controller: textcontroller,
              onTap: ontap ?? () {},
              keyboardType: keyboardType,
              maxLines: maxline,
              onSaved: onSaved,
              onChanged: onChanged,
              validator: validator,

              obscureText: obscureText,
              initialValue: initialValue,
              readOnly: readOnly ?? false,
              onEditingComplete: oneditingComplete,
              textAlign:textAlign?? TextAlign.start,
              decoration: InputDecoration(
                hintText: hintText,

                hintStyle:  TextStyle(
                  fontSize: 14,
                  color: Get.theme.disabledColor
                ),
                //floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: suffixIcon,
                prefixIcon: prefix,
                filled: isFill,
                fillColor: fillColor,
                isDense: true,
                border:  OutlineInputBorder(
                  borderRadius:  BorderRadius.all(
                    Radius.circular(radius?? 10.0),
                  ),
                  borderSide:hasBorder!?  BorderSide(
                    width: 1,
                    color: Get.theme.disabledColor,
                  ):BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
