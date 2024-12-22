import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/domain/model/status_bar_model.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';
import 'package:sylph_clothing/presentation/order/widgets/order_item.dart';
import 'package:sylph_clothing/presentation/order/widgets/order_status_bar_item.dart';

final orderStatusBar = [
  const StatusBarModel(
      statusTittle: "Order", statusIcon: FontAwesomeIcons.basketShopping),
  const StatusBarModel(
      statusTittle: "Pending", statusIcon: FontAwesomeIcons.solidClock),
  const StatusBarModel(
      statusTittle: "Place", statusIcon: FontAwesomeIcons.firstOrder),
  const StatusBarModel(
      statusTittle: "Shipped", statusIcon: FontAwesomeIcons.dolly),
  const StatusBarModel(
      statusTittle: "Delivered", statusIcon: FontAwesomeIcons.compactDisc),
  const StatusBarModel(
      statusTittle: "Cancelled", statusIcon: FontAwesomeIcons.squareXmark),
];

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> status = ValueNotifier("Order");

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const CustomeTopBarCore(
            barTittle: "Order",
          ),
          const Gap(AppGap.normalGap),

          // ! This is for status Bar

          ValueListenableBuilder(
            valueListenable: status,
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (final statusOption in orderStatusBar)
                        GestureDetector(
                            onTap: () {
                              status.value = statusOption.statusTittle;
                            },
                            child: OrderStatusBarItem(
                                selectStatus: status.value,
                                statusBar: statusOption))
                    ],
                  ),
                ),
              );
            },
          ),
          const Gap(AppGap.normalGap),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return const OrderItem();
              },
            ),
          ),
        ],
      ),
    ));
  }
}
