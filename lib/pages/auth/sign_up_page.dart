import 'package:cart_app/common_widget/app_text_field.dart';
import 'package:cart_app/common_widget/big_text.dart';
import 'package:cart_app/common_widget/show_custom_snackbar.dart';
import 'package:cart_app/controller/auth_controller.dart';
import 'package:cart_app/models/sign_up_body_model.dart';
import 'package:cart_app/utils/colors.dart';
import 'package:cart_app/utils/dimension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/custom_loader.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "assets/image/t.png",
      "assets/image/f.png",
      "assets/image/g.png",
    ];
    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in valid Email address ", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your Password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can't be less than six char ",
            title: "Password");
      } else {
        showCustomSnackBar("All validation complete ",
            title: "Perfect", isError: false);
        SignUpBody signUpBody = SignUpBody(
          phone: phone,
          password: password,
          name: name,
          email: email,
        );
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            debugPrint("Success Registration");
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
                      AppTextField(
                        hintText: "Email-Id",
                        textEditingController: emailController,
                        iconData: Icons.email,
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
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                        hintText: "Phone",
                        textEditingController: phoneController,
                        iconData: Icons.phone_android,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                        hintText: "Name",
                        textEditingController: nameController,
                        iconData: Icons.person,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
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
                              text: "Sign Up",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Have an account already?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Sign up using one of the following methods?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10 / 2,
                      ),
                      const Text(
                        "Powered By © Suraj Group",
                        style: TextStyle(color: AppColors.mainColor),
                      ),
                      Wrap(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: Dimensions.radius20,
                              backgroundImage: AssetImage(
                                signUpImages[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        },
      ),
    );
  }
}
