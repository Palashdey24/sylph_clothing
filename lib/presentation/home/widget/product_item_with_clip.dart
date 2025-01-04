import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/clipers/product_item_cliper.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/product_details/product_details_page.dart';

class ProductItemWithClip extends StatelessWidget {
  const ProductItemWithClip({super.key});

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = PhoneSize.deviceWidth(context);
    final double phoneHeight = PhoneSize.deviceHeight(context);

    const String productTittle = "Men Premium\nT-Shirt - Yellow";

    return GestureDetector(
      onTap: () =>
          AppNavigator.navigatorPush(context, const ProductDetailsPage()),
      child: Stack(
        children: [
          ClipPath(
            clipper: ProductItemCliper(),
            child: Container(
              color: AppColor.kDarkColor,
              margin: const EdgeInsets.only(right: 10, left: 10),
              padding: EdgeInsets.only(top: phoneHeight * 0.10),
              width: phoneWidth / 3,
              height: phoneHeight * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productTittle,
                    style: AppFont.bodySmall(context)
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(AppGap.normalGap),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "৳699 ",
                          style: AppFont.bodyMedium(context)
                              .copyWith(color: Colors.white),
                        ),
                        TextSpan(
                          text: "৳899",
                          style: AppFont.bodySmall(context).copyWith(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red,
                              decorationThickness: 2),
                        ),
                      ],
                    ),
                  ),
                  const Gap(2),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            child: SizedBox(
              height: phoneHeight * 0.10,
              width: phoneWidth / 3,
              child: CachedNetworkImage(
                  imageUrl:
                      "https://purepng.com/public/uploads/large/purepng.com-t-shirtt-shirtfabrict-shapegramnets-1421526429424bmxrh.png"),
            ),
          ),
        ],
      ),
    );
  }
}
