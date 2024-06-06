import 'package:dokan/presentation/common_ui/ui.dart';
import 'package:dokan/presentation/global_widget/image_widget.dart';
import 'package:dokan/presentation/screens/acount/widgets/account_link_widget.dart';
import 'package:dokan/presentation/screens/acount/widgets/edit_account_widget.dart';
import 'package:dokan/presentation/screens/root/controllers/root_controller.dart';
import 'package:dokan/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/acount_controller.dart';

class AcountView extends GetView<AcountController> {
  const AcountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('My Account'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView(

        children: [
          SizedBox(
            height: Get.size.height*0.01,
          ),
          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ImageWidget(
                    imageUrl: 'assets/logo.png',
                    height:  Get.size.width*0.35,
                    width: Get.size.width*0.35,
                    imageBoxFit: 'contain',
                    isNetworkImage: false,

                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.size.height*0.01,
          ),

           Obx(() => Column(
             children: [
               Text(controller.userData.value?.name??'',style: const TextStyle(
                 fontSize: 20,
               ),),
               Text(controller.userData.value?.email??'',style: TextStyle(
                 color: Get.theme.disabledColor,
               ),),
             ],
           )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: Ui.commonUi.getBoxDecoration(
              color: Get.theme.cardColor,
              shadowColor: Colors.grey.withOpacity(0.2),
              border: Border.all(
                color: Get.theme.cardColor,
              ),
            ),
            child: Obx(() => Column(
              children: [
                AccountLinkWidget(
                  icon: Icon(Icons.person_outline, color: Get.theme.primaryColor),
                  text: const Text("Account"),
                  onTap: () {
                    controller.isAccountExpanded.value=true;
                  },
                ),
                if(controller.isAccountExpanded.isTrue)
                  const EditAccountWidget(),
                AccountLinkWidget(
                  icon: Icon(Icons.lock_open, color: Get.theme.primaryColor),
                  text: const Text("Change Password"),
                  onTap: () {},
                ),
                AccountLinkWidget(
                  icon: Icon(Icons.notifications_outlined, color: Get.theme.primaryColor),
                  text: const Text("Notification"),
                  onTap: () {},
                ),
                AccountLinkWidget(
                  icon: Icon(Icons.favorite_border, color: Get.theme.primaryColor),
                  text: const Text("Wishlist"),
                  onTap: () {},
                ),


                controller.userLocalUseCase.getUserData()!=null?
                AccountLinkWidget(
                  icon: Icon(Icons.logout_outlined, color: Get.theme.primaryColor),
                  text: const Text("Logout"),
                  onTap: () {
                    controller.userLocalUseCase.clearUserData();
                    Get.find<RootController>().selectedIndex.value=0;
                    Get.toNamed(Routes.LOGIN);
                  },
                ):
                AccountLinkWidget(
                  icon: Icon(Icons.logout_outlined, color: Get.theme.primaryColor),
                  text: const Text("Login"),
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
