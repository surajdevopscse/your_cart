import 'package:cart_app/common_widget/app_icon.dart';
import 'package:cart_app/common_widget/big_text.dart';
import 'package:cart_app/common_widget/custom_loader.dart';
import 'package:cart_app/controller/auth_controller.dart';
import 'package:cart_app/controller/cart_controller.dart';
import 'package:cart_app/controller/user_controller.dart';
import 'package:cart_app/routes/route_helper.dart';
import 'package:cart_app/utils/colors.dart';
import 'package:cart_app/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: Dimensions.font26,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(builder: (_userController) {
          return _userLoggedIn
              ? (_userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Column(
                        children: [
                          //profile Icons
                          AppIcon(
                            icon: Icons.person,
                            bgColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height15 * 5,
                            size: Dimensions.height15 * 10,
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          //name
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      bgColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height20,
                                      size: Dimensions.height10 * 4,
                                    ),
                                    bigText: BigText(
                                      text: _userController.userModel.name,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  //phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      bgColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height20,
                                      size: Dimensions.height10 * 4,
                                    ),
                                    bigText: BigText(
                                      text: _userController.userModel.phone,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  //email
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      bgColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height20,
                                      size: Dimensions.height10 * 4,
                                    ),
                                    bigText: BigText(
                                      text: _userController.userModel.email,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  //address
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      bgColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height20,
                                      size: Dimensions.height10 * 4,
                                    ),
                                    bigText: BigText(
                                      text: "Fill Address",
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  //message
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message,
                                      bgColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height20,
                                      size: Dimensions.height10 * 4,
                                    ),
                                    bigText: BigText(
                                      text: "I love to eat healthy food",
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout_outlined,
                                        bgColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimensions.height20,
                                        size: Dimensions.height10 * 4,
                                      ),
                                      bigText: BigText(
                                        text: "Log Out",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const CustomLoader())
              : SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 8,
                          margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/image/signintocontinue.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height45,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(
                              child: BigText(
                                text: "Sign In",
                                color: Colors.white,
                                size: Dimensions.font26,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }));
  }
}
