import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';
import 'package:sylph_clothing/presentation/home/widget/product_items_react.dart';

class ProductPages extends StatelessWidget {
  const ProductPages({super.key, this.queryProduct});

  final String? queryProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomeTopBarCore(
            barTittle: queryProduct,
          ),
          const Gap(AppGap.mediumGap),
          Expanded(
            child: GridView.builder(
              itemCount: 100,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const RepaintBoundary(child: ProductItemReact());
              },
            ),
          ),
        ],
      )),
    );
  }
}
