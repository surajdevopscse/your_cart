import 'package:cart_app/common_widget/small_text.dart';
import 'package:cart_app/utils/dimension.dart';
import 'package:flutter/cupertino.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  const IconText({
    Key? key,
    required this.text,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: Dimensions.width10,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
