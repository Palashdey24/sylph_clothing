import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/home_base/base/home_body_base.dart';
import 'package:sylph_clothing/presentation/home_base/navigation/side_drawer.dart';
import 'package:sylph_clothing/presentation/home_base/widget/top_bar_widgets.dart';

class HomeSliderBase extends StatefulWidget {
  const HomeSliderBase({
    super.key,
  });

  @override
  State<HomeSliderBase> createState() => _HomeSliderBaseState();
}

class _HomeSliderBaseState extends State<HomeSliderBase>
    with SingleTickerProviderStateMixin {
  bool slideOpen = false;
  static const int kDurationMiSec = 500;
  late AnimationController _animationController;
  late Animation<double> _animationSlide;
  late Animation<double> _animationPage;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: kDurationMiSec))
      ..addListener(
        () {
          setState(() {});
        },
      );
    _animationSlide = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _animationPage = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final double phoneHeight = PhoneSize.deviceHeight(context);
    final double phoneWidth = PhoneSize.deviceWidth(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.kDarkColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Transform.translate(
              offset: Offset(_animationPage.value * (phoneWidth * 0.5), 0),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY((_animationPage.value * 30) * math.pi / 100),
                child: Transform.scale(
                  scale: slideOpen ? 0.85 : 1.0,
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.only(top: 65),
                      decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 10,
                                blurStyle: BlurStyle.inner),
                            BoxShadow(color: Colors.green, spreadRadius: 5),
                            BoxShadow(
                                color: Colors.yellowAccent,
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer),
                          ],
                          borderRadius: BorderRadius.circular(
                              slideOpen ? AppGap.largeGap : 0)),
                      child: const HomeBodyBase()),
                ),
              ),
            ),

            // ! This section code for Side drawer item
            Positioned(
              left: 0,
              child: Transform.translate(
                offset: Offset(_animationSlide.value * -(phoneWidth), 1),
                child: const SideDrawer(),
              ),
            ),

            // ! This section code for Drawer Icon
            AnimatedPositioned(
              top: 0,
              left: slideOpen ? phoneWidth * 0.55 : 0,
              duration: Duration(
                  milliseconds:
                      slideOpen ? kDurationMiSec - 200 : kDurationMiSec),
              child: Container(
                width: phoneWidth,
                color: slideOpen ? Colors.transparent : AppColor.kPrimaryColor,
                child: TopBarWidgets(
                    iconWidgets: IconButton(
                        onPressed: () {
                          setState(() {
                            slideOpen = !slideOpen;
                          });
                          slideOpen
                              ? _animationController.forward()
                              : _animationController.reverse();
                        },
                        icon: FaIcon(
                          !slideOpen
                              ? FontAwesomeIcons.sliders
                              : FontAwesomeIcons.arrowsToDot,
                          color: !slideOpen
                              ? AppColor.kDarkColor
                              : AppColor.kPrimaryColor,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
