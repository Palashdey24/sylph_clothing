import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';

class CartFinanceCardItem extends StatelessWidget {
  const CartFinanceCardItem(
      {super.key,
      required this.financeTittle,
      required this.financeNumber,
      this.financeNumberColor});

  final String financeTittle;
  final String financeNumber;
  final Color? financeNumberColor;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            financeTittle,
            style: AppFont.bodySmall(context)
                .copyWith(fontSize: 15, color: AppColor.kLightColor),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            financeNumber,
            textAlign: TextAlign.end,
            style: AppFont.bodySmall(context).copyWith(
                fontSize: 15,
                color: financeNumberColor ?? AppColor.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
