import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/data/local_data/category_data.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/product/product_pages.dart';

class UpperSections extends StatelessWidget {
  const UpperSections({super.key, required this.constraints});

  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    final favCat = favCategory;
    return RepaintBoundary(
      child: SizedBox(
        height: constraints.maxHeight * 0.45,
        width: constraints.maxWidth * 0.95,
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: constraints.maxWidth * 0.95,
              height: constraints.maxHeight * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppGap.mediumGap),
                  color: AppColor.kLightColor),
              child: CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    autoPlayInterval: const Duration(seconds: 7),
                    autoPlay: true,
                    autoPlayCurve: Curves.easeInExpo),
                items: [
                  for (final favCategory in favCat)
                    CachedNetworkImage(
                        width: constraints.maxWidth * 0.95,
                        fit: BoxFit.cover,
                        imageUrl: favCategory[1]),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: constraints.maxWidth * 0.95,
                height: constraints.maxHeight *
                    (constraints.maxHeight < 800
                        ? 0.30
                        : (constraints.maxHeight < 100 ? 0.25 : 0.40)),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth < 1600 ? 4 : 8),
                  children: [
                    for (var i = 0; i <= 7; i++)
                      GestureDetector(
                        onTap: () => AppNavigator.navigatorPush(
                            context,
                            ProductPages(
                              queryProduct: i == 7 ? "Offer" : favCat[i][0],
                            )),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppGap.normalGap),
                          ),
                          color: i == 7 ? Colors.blueGrey : AppColor.kDarkColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Gap(5),
                              i == 7
                                  ? FaIcon(
                                      FontAwesomeIcons.percent,
                                      size: constraints.maxHeight * 0.05,
                                      color: AppColor.kPrimaryColor,
                                    )
                                  : CachedNetworkImage(
                                      width: constraints.maxHeight * 0.05,
                                      height: constraints.maxHeight * 0.05,
                                      imageUrl: favCat[i][2]),
                              const Gap(5),
                              Text(
                                i == 7 ? "Offer" : favCat[i][0],
                                textAlign: TextAlign.center,
                                style: AppFont.bodySmall(context)
                                    .copyWith(color: AppColor.kLightColor),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
