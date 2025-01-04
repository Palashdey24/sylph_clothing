import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/helper/dialog_loading/dialogs_loading.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custom_plus_minus_item_core.dart';
import 'package:sylph_clothing/presentation/order_confirmation/order_confirmation_page.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, this.isBucket});

  final bool? isBucket;

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    ValueNotifier<int> cartQuantity = ValueNotifier<int>(quantity);

    return Container(
      height: 150,
      width: PhoneSize.deviceWidth(context) * 0.55,
      margin: const EdgeInsets.symmetric(
          horizontal: AppGap.mediumGap, vertical: AppGap.normalGap),
      decoration: BoxDecoration(
          color:
              isBucket == null ? AppColor.kPrimaryColor : AppColor.kLightColor,
          borderRadius: BorderRadius.circular(AppGap.mediumGap)),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: Card(
                color: AppColor.kLightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppGap.normalGap),
                  child: CachedNetworkImage(
                      height: 150,
                      fit: BoxFit.contain,
                      imageUrl:
                          "https://purepng.com/public/uploads/large/purepng.com-t-shirtt-shirtfabrict-shapegramnets-1421526429424bmxrh.png"),
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Men Premium T-Shirt",
                                textAlign: TextAlign.start,
                                style: isBucket == null
                                    ? AppFont.bodySmall(context)
                                    : AppFont.bodyMedium(context),
                              ),
                              const Gap(5),
                              if (isBucket == null)
                                Text(
                                  "Yellow - Size: M",
                                  style: AppFont.bodySmall(context)
                                      .copyWith(color: AppColor.kLightColor),
                                ),
                              const Gap(AppGap.normalGap),
                            ],
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(color: Colors.red, Icons.delete)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            "৳ 600",
                            style: AppFont.bodyLarge(context)
                                .copyWith(fontSize: 15),
                          ),
                          if (isBucket == null)
                            Expanded(
                              child: ValueListenableBuilder(
                                  valueListenable: cartQuantity,
                                  builder: (context, value, child) {
                                    return CustomPlusMinusItemCore(
                                      quantity: value,
                                      onPlusFn: () {
                                        if (cartQuantity.value < 5) {
                                          cartQuantity.value++;
                                        } else {
                                          DialogsLoadingCore.removeMessage(
                                              context);
                                          DialogsLoadingCore.showMessage(
                                            context,
                                            "Can't add more than 5 item",
                                            backColor: Colors.red.shade900,
                                          );
                                        }
                                      },
                                      onMinusFn: () {
                                        if (cartQuantity.value > 1) {
                                          cartQuantity.value--;
                                        } else {
                                          DialogsLoadingCore.removeMessage(
                                              context);
                                          DialogsLoadingCore.showMessage(
                                              context, "Can't be Zero",
                                              backColor: Colors.green);
                                        }
                                      },
                                    );
                                  }),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
