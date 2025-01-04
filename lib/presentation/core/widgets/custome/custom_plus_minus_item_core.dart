import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';

class CustomPlusMinusItemCore extends StatelessWidget {
  const CustomPlusMinusItemCore(
      {super.key,
      required this.onPlusFn,
      required this.onMinusFn,
      required this.quantity});

  final void Function() onPlusFn;
  final void Function() onMinusFn;

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: onPlusFn,
            icon: const CircleAvatar(
              radius: 15,
              backgroundColor: AppColor.kSecondColor,
              child: Icon(
                Icons.add,
                size: 15,
                color: Colors.teal,
              ),
            )),
        Text(
          "$quantity",
          softWrap: true,
          style:
              AppFont.bodyMedium(context).copyWith(color: AppColor.kDarkColor),
        ),
        IconButton(
            onPressed: onMinusFn,
            icon: const CircleAvatar(
              radius: 15,
              backgroundColor: AppColor.kSecondColor,
              child: FaIcon(
                FontAwesomeIcons.minus,
                size: 15,
                color: Colors.red,
              ),
            )),
      ],
    );
  }
}
