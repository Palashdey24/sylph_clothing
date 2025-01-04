import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/home/widget/product_item_with_clip.dart';
import 'package:sylph_clothing/presentation/home/widget/product_items_react.dart';

class CategoryWiseSectionBase extends StatelessWidget {
  const CategoryWiseSectionBase(
      {super.key,
      required this.sectionTittle,
      required this.sectionCoverSrc,
      required this.setionIndex});

  final String sectionTittle;
  final String sectionCoverSrc;
  final int setionIndex;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = PhoneSize.deviceWidth(context);
    final phoneHeight = PhoneSize.deviceHeight(context);
    return Stack(
      children: [
        SizedBox(
          width: setionIndex.isEven ? phoneWidth : phoneWidth * 0.95,
          height: phoneHeight * 0.6,
          child: Column(
            children: [
              Text(
                sectionTittle,
                style: AppFont.bodyMedium(context),
              ),
              const Gap(AppGap.normalGap),
              CachedNetworkImage(
                  height: phoneHeight * 0.2,
                  width: phoneWidth,
                  fit: BoxFit.cover,
                  imageUrl: sectionCoverSrc)
            ],
          ),
        ),
        const Gap(AppGap.mediumGap),
        Positioned(
            bottom: 0,
            child: SizedBox(
              height: phoneHeight * 0.50,
              width: setionIndex.isEven ? phoneWidth : phoneWidth * 0.95,
              child: GridView.count(
                crossAxisSpacing: setionIndex.isEven ? 15 : 5,
                mainAxisSpacing: AppGap.normalGap,
                crossAxisCount: setionIndex.isEven ? 2 : 3,
                childAspectRatio: setionIndex.isEven
                    ? (phoneHeight > 1000 ? 1.65 : 1.1)
                    : (phoneHeight > 1000 ? 1 : 0.65),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  if (setionIndex.isEven)
                    for (var i = 0; i < 4; i++) const ProductItemReact(),
                  if (setionIndex.isOdd)
                    for (var i = 0; i < 6; i++) const ProductItemWithClip(),
                ],
              ),
            ))
      ],
    );
  }
}
