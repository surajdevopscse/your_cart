import 'package:cart_app/common_widget/custom_loader.dart';
import 'package:cart_app/pages/auth/sign_up_page.dart';
import 'package:cart_app/routes/route_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common_widget/app_text_field.dart';
import '../../common_widget/big_text.dart';
import '../../common_widget/show_custom_snackbar.dart';
import '../../controller/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimension.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isEmpty) {
        showCustomSnackBar("Type in your email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in valid Email address ", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your Password", title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (_authController) {
            return !_authController.isLoading
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.screenHeight * 0.05,
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.25,
                          child: const Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 80,
                              backgroundImage:
                                  AssetImage("assets/image/logo part 1.png"),
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style: TextStyle(
                                  fontSize: Dimensions.font20 * 3 +
                                      Dimensions.font20 / 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.end,
                                text: TextSpan(
                                  text: "Sign into your account?",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        AppTextField(
                          hintText: "Email",
                          textEditingController: emailController,
                          iconData: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        AppTextField(
                          isObsecure: true,
                          hintText: "Password",
                          textEditingController: passwordController,
                          iconData: Icons.password_sharp,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                text: "Sign into your account",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            _login(_authController);
                          },
                          child: Container(
                            width: Dimensions.screenWidth / 2,
                            height: Dimensions.screenHeight / 13,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.mainColor,
                            ),
                            child: Center(
                              child: BigText(
                                text: "Sign In",
                                size: Dimensions.font20 + Dimensions.font20 / 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        RichText(
                          text: TextSpan(
                            //recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20,
                            ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(
                                        () => const SignUpPage(),
                                        transition: Transition.fade,
                                      ),
                                text: "Create",
                                style: TextStyle(
                                  color: AppColors.mainBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.font20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        const Text(
                          "Powered By © Suraj Group",
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                      ],
                    ),
                  )
                : const CustomLoader();
          },
        ));
  }
}
