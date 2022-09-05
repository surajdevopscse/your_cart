import 'package:cart_app/utils/colors.dart';
import 'package:cart_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final IconData iconData;
  final bool isObsecure;
  const AppTextField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.iconData,
    this.isObsecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        boxShadow: [
          BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(
                1,
                1,
              ),
              color: Colors.grey.withOpacity(0.2)),
        ],
      ),
      child: TextField(
        obscureText: isObsecure ? true : false,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            iconData,
            color: AppColors.mainColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
          ),
        ),
      ),
    );
  }
}
