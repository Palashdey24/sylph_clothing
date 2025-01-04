import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';
import 'package:sylph_clothing/presentation/home_base/base/home_main_base_with_slider.dart';
import 'package:sylph_clothing/presentation/order/orders_page.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppGap.mediumGap,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/confetti.svg",
                  height: constraints.maxHeight * 0.25,
                  width: constraints.maxWidth / 1.5,
                ),
                SvgPicture.asset(
                  "assets/svg/check.svg",
                  height: constraints.maxHeight * 0.2,
                ),
              ],
            ),
            Text(
              "Your Order \nHas Been Accepted",
              textAlign: TextAlign.center,
              style: AppFont.bodyLarge(context),
            ),
            Text(
              "Your items has been placed is on it's wat to being processed",
              textAlign: TextAlign.center,
              style: AppFont.bodyMedium(context).copyWith(color: Colors.grey),
            ),
            const Gap(AppGap.normalGap),
            GestureDetector(
              onTap: () => AppNavigator.navigatorReplace(
                  context,
                  const OrdersPage(
                    isFromConfirm: true,
                  )),
              child: SizedBox(
                height: constraints.maxWidth < 800 ? 50 : 80,
                child: Card(
                  color: AppColor.kDarkColor,
                  margin: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth < 800
                          ? AppGap.largeGap * 2
                          : constraints.maxWidth * 0.15),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "TRACK ORDER",
                      textAlign: TextAlign.center,
                      style: AppFont.bodyLarge(context)
                          .copyWith(color: AppColor.kPrimaryColor),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => AppNavigator.navigatorReplace(
                  context, const HomeMainBaseWithSlider()),
              child: Text(
                "BACK TO HOME",
                textAlign: TextAlign.center,
                style: AppFont.bodyLarge(context).copyWith(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
