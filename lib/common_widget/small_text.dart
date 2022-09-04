import 'package:cart_app/utils/colors.dart';
import 'package:cart_app/utils/dimension.dart';
import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final bool? isEclipse;
  double size;
  double height;
  SmallText({
    Key? key,
    this.height = 1.2,
    required this.text,
    this.color = AppColors.textColor,
    this.size = 0,
    this.isEclipse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? Dimensions.font12 : size,
          height: height,
          overflow: isEclipse! ? TextOverflow.ellipsis : TextOverflow.visible),
    );
  }
}
