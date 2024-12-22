import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/cart/carts_page.dart';
import 'package:sylph_clothing/presentation/category/category_page.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';

import 'package:sylph_clothing/presentation/home/home_page.dart';
import 'package:sylph_clothing/presentation/home_base/navigation/bottom_nav_bar.dart';
import 'package:sylph_clothing/presentation/home_base/widget/bar_icon_item.dart';
import 'package:sylph_clothing/domain/model/nav_items_model.dart';

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

const colorizeColors = [
  Colors.red,
  Colors.amber,
  Colors.limeAccent,
  Colors.yellowAccent,
];

class HomeBodyBase extends StatelessWidget {
  const HomeBodyBase({super.key});

  static final pages = [
    const HomePage(),
    const CategoryPage(),
    const CartsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> barIndex = ValueNotifier<int>(0);
    return ValueListenableBuilder(
        valueListenable: barIndex,
        builder: (context, value, child) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: BottomNavBar(bottomBarWidgets: [
              for (var navItems in NavItemsModel.values)
                BarIconItem(
                    curves: Curves.bounceIn,
                    navIcon: navItems.iconData!,
                    barString: navItems.tittle,
                    navFn: () {
                      if (navItems.tittle == "Categories") {
                        AppNavigator.navigatorPush(
                            context, const CategoryPage());
                        return;
                      }
                      barIndex.value = NavItemsModel.values.indexOf(navItems);
                    },
                    navIndex: NavItemsModel.values.indexOf(navItems),
                    selIndex: value),
            ]),
            body: IndexedStack(
              index: value,
              children: pages,
            ),
          );
        });
  }
}
