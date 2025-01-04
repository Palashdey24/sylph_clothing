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
import 'package:sylph_clothing/presentation/home/sections/flash_sale.dart';
import 'package:sylph_clothing/presentation/home/sections/trending_now.dart';
import 'package:sylph_clothing/presentation/home/sections/upper_sections.dart';
import 'package:sylph_clothing/presentation/home/widget/category_wise_section_base.dart';
import 'package:sylph_clothing/presentation/product/product_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favCat = favCategory;

    return LayoutBuilder(
      builder: (context, constraints) => ListView(
        children: [
          Column(
            children: [
              const RepaintBoundary(child: SearchBoxCore()),

              // ! The below sections for top carousel and categories
              UpperSections(
                constraints: constraints,
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
      ),
    );
  }
}
