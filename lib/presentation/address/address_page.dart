import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/address/add_address_page.dart';
import 'package:sylph_clothing/presentation/address/widgets/address_item_card.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomeTopBarCore(
            barTittle: "Address Book",
          ),
          const Gap(AppGap.normalGap),
          SizedBox(
            width: PhoneSize.deviceWidth(context),
            height: PhoneSize.deviceHeight(context) * 0.8,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppGap.largeGap),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    clipBehavior: Clip.hardEdge,
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        useSafeArea: true,
                        shape: const RoundedRectangleBorder(),
                        context: context,
                        builder: (context) {
                          return const AddAddressPage();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.kPrimaryColor,
                      side: const BorderSide(color: AppColor.kDarkColor),
                      alignment: Alignment.centerLeft,
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: Text(
                      "Add New Address",
                      style: AppFont.bodySmall(context),
                    ),
                  ),
                ),
                const Gap(AppGap.mediumGap),
                const AddressItemCard(),
                const AddressItemCard(
                  defaultCard: true,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
