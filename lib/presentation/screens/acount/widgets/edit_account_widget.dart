


import 'package:dokan/presentation/global_widget/block_button_widget.dart';
import 'package:dokan/presentation/global_widget/text_field_widget.dart';
import 'package:dokan/presentation/screens/acount/controllers/acount_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountWidget extends GetWidget<AcountController> {
  const EditAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          TextFieldWidget(
            keyboardType: TextInputType.emailAddress,
            isFill: true,
            fillColor: Get.theme.cardColor,
            hintText: 'youremail@gmail.com',
            labelText: 'Email',
            initialValue: '',
            hasBorder: true,
            onChanged: (v) {

            },

            validator: (v) {
              return v!=null&&v.isEmpty ? 'This field cannot be empty' :v!.length < 11 || v.length > 11?'Invalid phone number': null;
            },
          ),
          const SizedBox(height: 10),
          TextFieldWidget(
            keyboardType: TextInputType.text,
            isFill: true,
            fillColor: Get.theme.cardColor,
            hintText: 'Kawsar Ahmed',
            labelText: 'Full Name',
            initialValue: '',
            hasBorder: true,
            onChanged: (v) {

            },

            validator: (v) {
              return v!=null&&v.isEmpty ? 'This field cannot be empty' :v!.length < 11 || v.length > 11?'Invalid phone number': null;
            },
          ),
          const SizedBox(height: 10),
          TextFieldWidget(
            keyboardType: TextInputType.text,
            isFill: true,
            fillColor: Get.theme.cardColor,
            hintText: 'Bashundhara R/A',
            labelText: 'Street Address',
            initialValue: '',
            hasBorder: true,
            onChanged: (v) {

            },

            validator: (v) {
              return v!=null&&v.isEmpty ? 'This field cannot be empty' :v!.length < 11 || v.length > 11?'Invalid phone number': null;
            },
          ),
          const SizedBox(height: 10),

          TextFieldWidget(
            keyboardType: TextInputType.text,
            isFill: true,
            fillColor: Get.theme.cardColor,
            hintText: 'Unit 123',
            labelText: 'Apt,Suite,Bldg (Optional)',
            initialValue: '',
            hasBorder: true,
            onChanged: (v) {

            },

            validator: (v) {
              return  null;
            },
          ),


          const SizedBox(height: 10),

          TextFieldWidget(
            keyboardType: TextInputType.text,
            isFill: true,
            fillColor: Get.theme.cardColor,
            hintText: '123',
            labelText: 'Zip Code',
            initialValue: '',
            hasBorder: true,
            onChanged: (v) {

            },

            validator: (v) {
              return  null;
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlockButtonWidget(
                  color: Get.theme.cardColor,
                  onPressed: ()
                  {
                    controller.isAccountExpanded.value=false;
                  },
                  radius: 10,
                  hasShadow: true,
                  width: Get.size.width*0.3,
                  child: Text('Cancel',style: TextStyle(
                    color: Get.theme.primaryColor,
                  ),),
                ),

                BlockButtonWidget(
                  color: Get.theme.primaryColor,
                  onPressed: ()
                  {

                  },
                  radius: 10,
                  hasShadow: true,
                  width: Get.size.width*0.3,
                  child: Text('Save',style: TextStyle(
                    color: Get.theme.cardColor,
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
