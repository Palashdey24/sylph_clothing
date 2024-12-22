import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/data/local_data/category_data.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/core/widgets/search_box/search_box_core.dart';
import 'package:sylph_clothing/presentation/home/flash_sale.dart';
import 'package:sylph_clothing/presentation/home/trending_now.dart';
import 'package:sylph_clothing/presentation/home/widget/category_wise_section_base.dart';
import 'package:sylph_clothing/presentation/product/product_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favCat = favCategory;

    return ListView(
      children: [
        Column(
          children: [
            const RepaintBoundary(child: SearchBoxCore()),

            // ! The below size box for top carousel and categories
            RepaintBoundary(
              child: SizedBox(
                width: PhoneSize.deviceWidth(context) * 0.95,
                height: PhoneSize.deviceHeight(context) * 0.45,
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: PhoneSize.deviceWidth(context) * 0.95,
                      margin: EdgeInsets.only(
                          bottom: PhoneSize.deviceHeight(context) * 0.20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppGap.mediumGap),
                          color: AppColor.kLightColor),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3),
                            autoPlayInterval: const Duration(seconds: 7),
                            autoPlay: true,
                            autoPlayCurve: Curves.easeInExpo),
                        items: [
                          for (final favCategory in favCat)
                            CachedNetworkImage(
                                width: PhoneSize.deviceWidth(context) * 0.95,
                                fit: BoxFit.cover,
                                imageUrl: favCategory[1]),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: PhoneSize.deviceWidth(context) * 0.95,
                        height: PhoneSize.deviceHeight(context) * 0.25,
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          children: [
                            for (var i = 0; i <= 7; i++)
                              GestureDetector(
                                onTap: () => AppNavigator.navigatorPush(
                                    context,
                                    ProductPages(
                                      queryProduct:
                                          i == 7 ? "Offer" : favCat[i][0],
                                    )),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppGap.normalGap),
                                  ),
                                  color: i == 7
                                      ? Colors.blueGrey
                                      : AppColor.kDarkColor,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Gap(5),
                                      i == 7
                                          ? const FaIcon(
                                              FontAwesomeIcons.percent,
                                              size: 35,
                                              color: AppColor.kPrimaryColor,
                                            )
                                          : CachedNetworkImage(
                                              width: 35,
                                              height: 35,
                                              imageUrl: favCat[i][2]),
                                      const Gap(5),
                                      Text(
                                        i == 7 ? "Offer" : favCat[i][0],
                                        textAlign: TextAlign.center,
                                        style: AppFont.bodySmall(context)
                                            .copyWith(
                                                color: AppColor.kLightColor),
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
            ),
            const Gap(AppGap.normalGap),
            //The below size box for flash Sale
            const FlashSale(),

            const Gap(AppGap.largeGap),
            const TrendingNow(),
            const Gap(AppGap.largeGap),
            for (final favCategory in favCat)
              RepaintBoundary(
                child: CategoryWiseSectionBase(
                  setionIndex: favCat.indexOf(favCategory),
                  sectionCoverSrc: favCategory[1],
                  sectionTittle: favCategory[0],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
