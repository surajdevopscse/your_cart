import 'package:cart_app/utils/colors.dart';
import 'package:cart_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage(
      {Key? key,
      required this.text,
      this.imgPath = "assets/image/empty_cart.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imgPath,
            height: Dimensions.screenHeight * 0.22,
            width: Dimensions.screenWidth * 0.22,
            color: AppColors.mainColor,
          ),
          SizedBox(
            height: Dimensions.screenHeight * 0.03,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: Dimensions.screenHeight * 0.0175,
              color: Theme.of(context).disabledColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
