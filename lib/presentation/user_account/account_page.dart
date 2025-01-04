import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/address/address_page.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';
import 'package:sylph_clothing/presentation/order/orders_page.dart';
import 'package:sylph_clothing/presentation/user_account/widgets/account_info_card.dart';
import 'package:sylph_clothing/presentation/user_account/widgets/account_info_tab_items.dart';

final accountTabFirsts = [
  //["Setting", FontAwesomeIcons.gears],
  ["My Order", FontAwesomeIcons.truckFast, const OrdersPage()],
  ["Address", FontAwesomeIcons.solidAddressBook, const AddressPage()],
  ["Change Password", FontAwesomeIcons.key],
];

final accountTabSeconds = [
  ["Help & Support", FontAwesomeIcons.headset],
  ["Log Out", FontAwesomeIcons.rightFromBracket],
  ["Delete Account", FontAwesomeIcons.ban],
];

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: PhoneSize.deviceHeight(context),
            width: PhoneSize.deviceWidth(context),
            child: const Column(
              children: [
                CustomeTopBarCore(
                  barTittle: "Account",
                  backColor: Colors.blueGrey,
                ),
                AccountInfoCard(),
              ],
            ),
          ),
          Positioned(
              top: PhoneSize.deviceHeight(context) * 0.35,
              left: 50,
              right: 50,
              child: SizedBox(
                height: PhoneSize.deviceHeight(context) * 0.50,
                width: PhoneSize.deviceWidth(context) * 0.75,
                child: Card(
                  elevation: 10,
                  color: AppColor.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppGap.largeGap),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    children: [
                      for (final accountTabOne in accountTabFirsts)
                        AccountInfoTabItems(
                          itemTittle: accountTabOne[0] as String,
                          itemIcon: accountTabOne[1] as IconData,
                          onTab: () {
                            AppNavigator.navigatorPush(
                                context, accountTabOne[2] as Widget);
                          },
                        ),
                      const Gap(AppGap.normalGap),
                      const Divider(
                        height: 1,
                      ),
                      const Gap(AppGap.normalGap),
                      for (final accountTabSec in accountTabSeconds)
                        AccountInfoTabItems(
                          itemTittle: accountTabSec[0] as String,
                          itemIcon: accountTabSec[1] as IconData,
                          onTab: () {
                            AppNavigator.navigatorPush(
                                context, accountTabSec[2] as Widget);
                          },
                        ),
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
