import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/auth/widgets/credentials_main_frame.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/config/utility/string/app_string.dart';
import 'package:sylph_clothing/presentation/core/clipers/card_triangle_quadratic_bezier_path.dart';
import 'package:sylph_clothing/presentation/core/clipers/photo_bottom_quadratic_bezier_path.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/helper/dialog_loading/dialogs_loading.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';

class CredentialsBase extends StatefulWidget {
  const CredentialsBase({super.key});

  @override
  State<CredentialsBase> createState() => _CredentialsBaseState();
}

class _CredentialsBaseState extends State<CredentialsBase>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> offsetTop;
  late Animation<Offset> offsetBottom;
  late Animation<Offset> offsetMiddle;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(
            () {
              setState(() {});
            },
          );
    offsetTop =
        Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0.0, 0))
            .animate(_animationController);

    offsetBottom =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0.0, 0))
            .animate(_animationController);

    offsetMiddle =
        Tween<Offset>(begin: const Offset(1, 1), end: const Offset(0.0, 0))
            .animate(_animationController);
    _animationController.forward();

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SlideTransition(
                    position: offsetTop,
                    child: ClipPath(
                      clipper: PhotoBottomQuadraticBezierPath(),
                      child: SizedBox(
                        height: PhoneSize.deviceHeight(context) * 0.5,
                        width: PhoneSize.deviceWidth(context),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://cdn.pixabay.com/photo/2020/06/20/16/13/male-5321547_1280.jpg"),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: offsetBottom,
                    child: ClipPath(
                      clipper: CardTriangleQuadraticBezierPath(),
                      child: SizedBox(
                        height: PhoneSize.deviceHeight(context) * 0.5,
                        width: PhoneSize.deviceWidth(context),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://cdn.pixabay.com/photo/2024/05/01/07/57/fabric-8731636_1280.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedOpacity(
                  opacity: _animationController.value,
                  duration: const Duration(
                      milliseconds: AppString.kDurationMiSec * 4),
                  child: const CredentialsMainFrame()),
            ],
          )
        ],
      ),
    );
  }
}
