import 'package:cart_app/common_widget/app_icon.dart';
import 'package:cart_app/common_widget/big_text.dart';
import 'package:cart_app/utils/colors.dart';
import 'package:cart_app/utils/dimension.dart';
import 'package:flutter/material.dart';

import '../../common_widget/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: Dimensions.font26,
          color: Colors.white,
        ),
      ),
      body: Container(
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
                        text: "Suraj Yadav",
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
                        text: "+917007667165",
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
                        text: "suraj@gmail.com",
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
