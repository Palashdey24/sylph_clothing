import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/assets/app_asset.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/home/widget/product_item_with_clip.dart';
import 'package:sylph_clothing/presentation/home_base/base/home_body_base.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PhoneSize.deviceWidth(context) * 0.95,
      height: PhoneSize.deviceHeight(context) * 0.40,
      child: Stack(
        children: [
          Container(
            width: PhoneSize.deviceWidth(context) * 0.95,
            height: PhoneSize.deviceHeight(context) * 0.40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppGap.largeGap),
                color: AppColor.kLightColor,
                image: const DecorationImage(
                    image: AssetImage(AppAssets.flashGif))),
          ),
          Positioned(
            top: 20,
            child: SizedBox(
              width: PhoneSize.deviceWidth(context) * 0.95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flex(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    direction: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 250.0,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            ColorizeAnimatedText(
                              'FLASH SALE',
                              textStyle: AppFont.bodyLarge(context).copyWith(
                                fontFamily: 'Horizon',
                              ),
                              colors: colorizeColors,
                            ),
                          ],
                          isRepeatingAnimation: true,
                          totalRepeatCount: 7,
                          onTap: () {},
                        ),
                      ),
                      Image.asset(
                          width: 60,
                          height: 60,
                          "${AppAssets.gifPath}sales.gif")
                    ],
                  ),
                  Flex(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    children: [
                      const Text(
                        "  Product",
                        style: AppFont.exampleText,
                      ),
                      Text(
                        "Show All  ",
                        style: AppFont.bodySmall(context)
                            .copyWith(color: AppColor.kPrimaryColor),
                      ),
                    ],
                  ),
                  Container(
                    height: PhoneSize.deviceHeight(context) * 0.25,
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
      ),
    );
  }
}
