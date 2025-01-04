import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/cart/widgets/cart_finance_card.dart';
import 'package:sylph_clothing/presentation/cart/widgets/cart_item.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';
import 'package:sylph_clothing/presentation/order_confirmation/order_confirmation_page.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key, this.barEnable, this.bottomCardMargin});
  final bool? barEnable;
  final double? bottomCardMargin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: PhoneSize.deviceWidth(context),
          height: PhoneSize.deviceHeight(context),
          child: ListView(
            children: [
              if (barEnable != null) const Gap(60),
              const CartItem(),
              const CartItem(),
              const CartItem(),
              const CartItem(),
              const CartFinanceCard(),
            ],
          ),
        ),

        Positioned(
          bottom: bottomCardMargin ?? 70,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 50,
              margin: EdgeInsets.zero,
              width: PhoneSize.deviceWidth(context) * 0.9,
              decoration: BoxDecoration(
                  color: AppColor.kDarkColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(AppGap.mediumGap)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Text(
                        "Total Price - ৳2,200",
                        style: AppFont.bodyLarge(context).copyWith(
                            color: AppColor.kPrimaryColor, fontSize: 15),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () => AppNavigator.navigatorReplace(
                          context,
                          const OrderConfirmationPage(),
                        ),
                        child: Text(
                          "| Next >",
                          textAlign: TextAlign.left,
                          style: AppFont.bodyMedium(context)
                              .copyWith(color: AppColor.kPrimaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // ! When it come from Product details page the top Bar only show then

        if (barEnable != null)
          const Positioned(
            top: 0,
            child: CustomeTopBarCore(),
          ),
      ],
    );
  }
}
