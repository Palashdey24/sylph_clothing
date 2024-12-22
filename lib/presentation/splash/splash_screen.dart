import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sylph_clothing/presentation/auth/base/credentials_base.dart';
import 'package:sylph_clothing/presentation/config/assets/app_asset.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/core/clipers/splash_quadratic_bezier_path.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offset;

  @override
  void initState() {
    // TODO: implement initState

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(
            () {
              setState(() {});
            },
          );
    _offset = Tween<Offset>(begin: const Offset(-1.0, -0.5), end: Offset.zero)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(_animationController);

    _animationController.forward();

    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        if (!mounted) {
          return;
        } else {
          // AppNavigator.navigatorReplace(context, const CredentialsBase());
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SlideTransition(
              position: _offset,
              child: ClipPath(
                clipper: SplashQuadraticBezierPath(),
                child: Container(
                  width: PhoneSize.deviceWidth(context) * 0.65,
                  height: PhoneSize.deviceHeight(context) * 0.4,
                  decoration: const BoxDecoration(color: AppColor.kDarkColor),
                  padding: const EdgeInsets.only(
                      left: AppGap.normalGap, top: AppGap.largeGap * 1.5),
                  child: AnimatedOpacity(
                    opacity: _animationController.value,
                    duration: const Duration(seconds: 1),
                    child: Text(
                      "Start Journey \nWith Sylph",
                      style: GoogleFonts.pattaya().copyWith(
                          fontSize: 35,
                          color: AppColor.kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: const CircleBorder(),
                  child:
                      Image.asset(width: 120, height: 120, AppAssets.appLogo)),
            ),
            const Positioned(
              top: 0,
              bottom: 200,
              left: 50,
              right: 0,
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    "assets/gif/feather.gif",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: AppGap.normalGap,
              left: AppGap.mediumGap,
              child: Image.asset(
                "assets/shoes.png",
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
