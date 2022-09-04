import 'package:cart_app/common_widget/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String name;
  const AppColumn({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: name,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimensions.height15,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "1287"),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconText(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconText(
              icon: Icons.location_on,
              text: "1.7 Km",
              iconColor: AppColors.mainColor,
            ),
            IconText(
              icon: Icons.access_time_rounded,
              text: "32 min",
              iconColor: AppColors.iconColor2,
            )
          ],
        ),
      ],
    );
  }
}