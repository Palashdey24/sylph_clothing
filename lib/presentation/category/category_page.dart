import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sylph_clothing/data/local_data/category_data.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MasonryGridView.count(
              padding: const EdgeInsets.symmetric(vertical: 65),
              itemCount: favCategory.length,
              crossAxisCount: 2,
              mainAxisSpacing: AppGap.mediumGap,
              crossAxisSpacing: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: index.isOdd ? 300 : 150,
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.hardEdge,
                    color: AppColor.kSecondColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            favCategory[index][0],
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: AppFont.bodyMedium(context).copyWith(),
                          ),
                        ),
                        Expanded(
                          child: CachedNetworkImage(
                              height: 199, imageUrl: favCategory[index][2]),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),

            // + For the Top Bar
            const Positioned(
                top: 0,
                child: CustomeTopBarCore(
                  barTittle: "Category",
                ))
          ],
        ),
      ),
    );
  }
}
