import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';

enum NavItemsModel {
  home,
  categories,
  cart;

  IconData? get iconData {
    switch (this) {
      case home:
        return FontAwesomeIcons.house;
      case categories:
        return FontAwesomeIcons.atlassian;
      case cart:
        return FontAwesomeIcons.basketShopping;
    }
  }

  Color? get color {
    switch (this) {
      case home:
        return Colors.green;
      case categories:
        return Colors.blue;
      case cart:
        return Colors.yellowAccent;
    }
  }

  String get tittle {
    switch (this) {
      case home:
        return "Home";
      case categories:
        return "Categories";
      case cart:
        return "Cart";
    }
  }

  BottomBarItem get navOptions {
    return BottomBarItem(
      inActiveItem: FaIcon(
        iconData,
        color: AppColor.kPrimaryColor,
      ),
      activeItem: FaIcon(
        iconData,
        color: color,
      ),
      itemLabel: tittle,
    );
  }
}
