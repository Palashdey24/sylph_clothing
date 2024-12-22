import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/cart/widgets/cart_finance_card_item.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/clipers/card_triangle_quadratic_bezier_path.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/field/form_text_field_core.dart';

class CartFinanceCard extends StatelessWidget {
  const CartFinanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CardTriangleQuadraticBezierPath(),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        color: AppColor.kDarkColor,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black12, width: 1),
/*          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),*/
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppGap.normalGap, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Use Your Discount Code",
                textAlign: TextAlign.start,
                style: AppFont.bodyLarge(context).copyWith(
                    fontSize: AppGap.mediumGap, color: AppColor.kPrimaryColor),
              ),
              const Gap(AppGap.normalGap),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 3,
                    child: FormTextFieldCore(
                      onSave: (value) {},
                      fieldHint: "Add Promo Code",
                      fieldType: TextInputType.text,
                      vaildator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const Gap(AppGap.normalGap),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.kPrimaryColor),
                      child: Text(
                        "Apply",
                        style: AppFont.bodyMedium(context)
                            .copyWith(color: AppColor.kDarkColor),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(AppGap.mediumGap),
              const CartFinanceCardItem(
                  financeTittle: "Subtotal", financeNumber: "Take 1,800"),
              const Gap(AppGap.normalGap),
              const CartFinanceCardItem(
                  financeTittle: "Fee Delivery",
                  financeNumber: "Take 0 to 120"),
              const Gap(AppGap.normalGap),
              const CartFinanceCardItem(
                financeTittle: "Discount",
                financeNumber: "-Take 0",
                financeNumberColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
