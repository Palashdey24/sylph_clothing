import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/cart/widgets/cart_item.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';

class BucketListPage extends StatelessWidget {
  const BucketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          const CustomeTopBarCore(
            barTittle: "Bucket List",
          ),
          const Gap(AppGap.normalGap),
          for (var i = 0; i < 5; i++)
            const CartItem(
              isBucket: true,
            ),
        ],
      )),
    );
  }
}
