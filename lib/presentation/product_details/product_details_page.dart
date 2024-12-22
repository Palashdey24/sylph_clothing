import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/cart/carts_page.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/helper/dialog_loading/dialogs_loading.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/product_details/widgets/product_details_add_cart.dart';
import 'package:sylph_clothing/presentation/product_details/widgets/product_details_features.dart';
import 'package:sylph_clothing/presentation/product_details/widgets/product_details_price_review.dart';
import 'package:sylph_clothing/presentation/product_details/widgets/product_details_sizes.dart';
import 'package:sylph_clothing/presentation/product_details/widgets/product_details_upper.dart';

final productSize = ['S', 'M', 'L', 'XL', 'XLL'];

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final phoneWidth = PhoneSize.deviceWidth(context);
    final phoneHeight = PhoneSize.deviceHeight(context);

    String selectSize = 'N/A';
    bool haveSize = true;

    // ? This function for the cart widget

    Future<bool> selectSizeCheck(int quantity) async {
      if (haveSize && selectSize == 'N/A') {
        DialogsLoadingCore.removeMessage(context);
        DialogsLoadingCore.showMessage(context, "Please select a size",
            backColor: Colors.teal);
        return false;
      } else if (quantity > 0) {
        AppNavigator.navigatorReplace(
            context,
            const Scaffold(
              body: SafeArea(
                child: CartsPage(
                  barEnable: true,
                  bottomCardMargin: 10,
                ),
              ),
            ));
        return false;
      }

      return true;
    }

    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductDetailsAddCart(
          haveSize: true,
          productSize: selectSize,
          sizeSelect: (productQuantity) => selectSizeCheck(productQuantity),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 90),
          children: [
            const ProductDetailsUpper(),
            Container(
              margin: EdgeInsets.zero,
              color: AppColor.kLightColor,
              child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(
                    vertical: AppGap.mediumGap, horizontal: AppGap.mediumGap),
                decoration: const BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppGap.largeGap * 2.5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ProductDetailsPriceReview(),
                    const Gap(AppGap.mediumGap),
                    Text(
                      "Size",
                      textAlign: TextAlign.center,
                      style: AppFont.bodyMedium(context).copyWith(fontSize: 20),
                    ),
                    const Gap(AppGap.normalGap),
                    ProductDetailsSizes(
                      productSize: productSize,
                      selectSizeFn: (size) {
                        selectSize = size;
                      },
                    ),
                    const Gap(AppGap.largeGap),
                    Text(
                      "Men Premium T-Shirt - Yellow",
                      style: AppFont.bodyMedium(context),
                    ),
                    const Gap(AppGap.largeGap),
                    const ProductDetailsFeatures(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
