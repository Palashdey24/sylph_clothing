import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/home/widget/product_item_with_clip.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = PhoneSize.deviceWidth(context);
    final double phoneHeight = PhoneSize.deviceHeight(context);
    return Stack(
      children: [
        Container(
          width: phoneWidth * 0.95,
          height: phoneHeight < 800 ? 240 : phoneHeight * 0.33,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple.shade50, Colors.blueGrey]),
              borderRadius: BorderRadius.circular(AppGap.largeGap),
              color: AppColor.kLightColor),
        ),
        Positioned(
          top: 15,
          child: SizedBox(
            width: phoneWidth * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  " Trending Now",
                  textAlign: TextAlign.start,
                  style: AppFont.bodyMedium(context),
                ),
                const Gap(AppGap.normalGap),
                Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      " Best Selling Product",
                      style: AppFont.bodySmall(context)
                          .copyWith(color: AppColor.kPrimaryColor),
                    ),
                    Text(
                      "Show All  ",
                      style: AppFont.bodySmall(context)
                          .copyWith(color: AppColor.kPrimaryColor),
                    ),
                  ],
                ),
                Container(
                  height: PhoneSize.deviceHeight(context) * 0.20,
                  margin: const EdgeInsets.only(top: AppGap.largeGap),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ProductItemWithClip();
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
