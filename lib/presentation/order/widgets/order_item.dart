import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.kDarkColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppGap.largeGap)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppGap.normalGap, vertical: AppGap.largeGap),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "# 1234567",
              style: AppFont.bodyLarge(context)
                  .copyWith(fontSize: 15, color: AppColor.kPrimaryColor),
            ),
            const Gap(5),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "28 Aug 2024",
                        textAlign: TextAlign.start,
                        style: AppFont.bodyMedium(context)
                            .copyWith(color: AppColor.kLightColor),
                      ),
                      const Gap(5),
                      Text(
                        "Complete",
                        style: AppFont.bodyMedium(context)
                            .copyWith(color: AppColor.kLightColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "৳ 1500",
                        style: AppFont.bodyMedium(context)
                            .copyWith(color: AppColor.kSecondColor),
                      ),
                      const Gap(5),
                      Text(
                        "COD",
                        style: AppFont.bodyMedium(context)
                            .copyWith(color: AppColor.kSecondColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(AppGap.normalGap),
            ExpansionTile(
              title: Text(
                "Items",
                style: AppFont.bodySmall(context)
                    .copyWith(color: AppColor.kPrimaryColor),
              ),
              children: [
                for (var i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppGap.normalGap),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://www.pngarts.com/files/1/Formal-Shirts-For-Men-PNG-Free-Download.png",
                          height: AppGap.largeGap + 5,
                          width: AppGap.largeGap + 5,
                        ),
                        const Gap(AppGap.normalGap),
                        Expanded(
                          child: Text(
                            "Product Name x Color x Size",
                            maxLines: 5,
                            softWrap: true,
                            style: AppFont.bodySmall(context)
                                .copyWith(color: AppColor.kPrimaryColor),
                          ),
                        ),
                        const Gap(AppGap.normalGap),
                        Text("2x550 = 1100",
                            style: AppFont.bodySmall(context)
                                .copyWith(color: AppColor.kPrimaryColor)),
                      ],
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
