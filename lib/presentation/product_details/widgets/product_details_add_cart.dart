
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/helper/dialog_loading/dialogs_loading.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custom_plus_minus_item_core.dart';

class ProductDetailsAddCart extends StatelessWidget {
  const ProductDetailsAddCart({
    super.key,
    this.haveSize,
    this.productSize,
    required this.sizeSelect,
  });

  final Future<bool> Function(int productQuantity) sizeSelect;

  final bool? haveSize;
  final String? productSize;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = PhoneSize.deviceWidth(context);
    ValueNotifier<int> cartItem = ValueNotifier<int>(0);

    // ? This function for cart plus
    void onAddCartFn(int cartValue) {
      DialogsLoadingCore.removeMessage(context);
      sizeSelect(cartValue).then(
        (value) {
          if (cartValue == 0 && value == true) {
            cartItem.value++;
            return;
          }
          return;
        },
      );
    }

    void onCartPlusFn() {
      if (cartItem.value < 5) {
        cartItem.value++;
      } else {
        DialogsLoadingCore.removeMessage(context);
        DialogsLoadingCore.showMessage(
          context,
          "Can't add more than 5 item",
          backColor: Colors.red.shade900,
        );
      }
    }

    // ? This function for cart minus

    void onCartMinusFn() {
      cartItem.value--;
    }

    return ValueListenableBuilder(
      valueListenable: cartItem,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (value > 0)
              Card(
                color: AppColor.kLightColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                elevation: AppGap.mediumGap,
                child: CustomPlusMinusItemCore(
                    onPlusFn: onCartPlusFn,
                    onMinusFn: onCartMinusFn,
                    quantity: cartItem.value),
              ),
            if (value > 0) const Gap(AppGap.largeGap),
            ElevatedButton(
              onPressed: () => onAddCartFn(value),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    value != 0 ? const Color.fromARGB(207, 5, 23, 7) : null,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                elevation: AppGap.mediumGap,
                minimumSize: Size(
                    value != 0 ? phoneWidth * 0.45 : phoneWidth * 0.75, 50),
              ),
              child: Text(
                value == 0 ? "Add To Cart" : "Checkout",
                softWrap: true,
                style: AppFont.bodyMedium(context)
                    .copyWith(color: AppColor.kPrimaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
