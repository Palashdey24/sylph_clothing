
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/product_details/widgets/size_charts_cell.dart';

final List<Map<String, dynamic>> productFeature = [
  {"feature_name": "Style", "description": "loose fit"},
  {"feature_name": "Fabric", "description": "Single jersey , GSM :175"},
  {"feature_name": "Color", "description": "Silver"},
  {
    "feature_name": "Size",
    "description": [
      {
        "attribute": "Size",
        "element": ["S", "M", "L", "XL", "XLL"],
      },
      {
        "attribute": "Chest (Round)",
        "element": ["38", "39", "40.5", "43", "44"],
      },
      {
        "attribute": "Length",
        "element": ["25", "27.5", "28.5", "29", "29.5"],
      },
      {
        "attribute": "Sleeve",
        "element": ["8", "8.25", "8.5", "8.75", "9"],
      },
    ],
  },
];

class ProductDetailsFeatures extends StatelessWidget {
  const ProductDetailsFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeChart = productFeature
        .where(
          (element) => element['feature_name'] == "Size",
        )
        .toList();
    //final sizes=sizeChart['description'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          softWrap: true,
          "Elevate your everyday wardrobe with our Drop Shoulder T-Shirt, designed for ultimate comfort and a laid-back vibe. Crafted from soft, breathable fabric, this tee features a relaxed fit and stylish Back side Printed drop shoulder design that flatters every body type.",
        ),
        const Gap(AppGap.normalGap),
        for (final feature in productFeature)

          // * Show size of feature are for size, else it show normal rich text
          Padding(
            padding: const EdgeInsets.only(top: AppGap.mediumGap),
            child: feature['feature_name'] != "Size"
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${feature['feature_name']} :",
                          style: AppFont.bodyMedium(context)
                              .copyWith(color: AppColor.kDarkColor),
                        ),
                        TextSpan(
                          text: "  ${feature['description']} ",
                          style: AppFont.bodyMedium(context).copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                :

                // * It show when only Size are available for this product
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(AppGap.normalGap),
                      Text(
                        "Size chart - In inches (Expected Deviation < 3%)",
                        softWrap: true,
                        style: AppFont.bodyMedium(context),
                      ),
                      const Gap(AppGap.mediumGap),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.zero,
                        child: Table(
                          border: TableBorder.all(color: AppColor.kLightColor),
                          children: [
                            for (final sizecharts in sizeChart[0]
                                ['description'])
                              TableRow(
                                children: [
                                  SizeChartsCell(
                                    cellText: sizecharts['attribute'],
                                    cellBoxColor: Colors.blueGrey,
                                  ),
                                  for (final chartElement
                                      in sizecharts['element'])
                                    SizeChartsCell(
                                      cellText: chartElement,
                                    )
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
      ],
    );
  }
}
