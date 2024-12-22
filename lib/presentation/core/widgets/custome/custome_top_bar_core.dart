import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/widgets/button/back_custom_button_core.dart';

class CustomeTopBarCore extends StatelessWidget {
  const CustomeTopBarCore({super.key, this.barTittle, this.backColor});

  final String? barTittle;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: PhoneSize.deviceWidth(context),
      color: backColor ?? AppColor.kPrimaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackCustomButtonCore(
            circleRadius: 15,
          ),
          Text(
            barTittle ?? "My Cart",
            textAlign: TextAlign.center,
            style: AppFont.bodyMedium(context),
          ),
          const SizedBox(
            width: 10,
            height: 10,
          )
        ],
      ),
    );
  }
}
