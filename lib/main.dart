import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sylph_clothing/presentation/auth/base/credentials_base.dart';
import 'package:sylph_clothing/presentation/auth/widgets/credentials_main_frame.dart';
import 'package:sylph_clothing/presentation/config/theme/app_theme.dart';
import 'package:sylph_clothing/presentation/home/home_page.dart';
import 'package:sylph_clothing/presentation/home_base/base/home_slider_base.dart';
import 'package:sylph_clothing/presentation/splash/splash_screen.dart';

void main() {
  //! this debut paint for repaint boundary
  //debugRepaintRainbowEnabled = true;

  runApp(
    DevicePreview(
      backgroundColor: Colors.white, // Professional, clean background
      enabled: true, // Let the magic begin!
      defaultDevice: Devices.ios.iPhone13ProMax, // Start with a bang
      isToolbarVisible: true, // Give users control
      availableLocales: const [Locale('en', 'US')],
      tools: const [
        DeviceSection(
          model: true, // Option to change device model to fit your needs
          orientation: false, // Lock to portrait for consistent demo
          frameVisibility: false, // Hide frame options
          virtualKeyboard: false, // Hide keyboard
        ),
      ],

      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Sylph Clothing',
        theme: AppTheme.appTheme.copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: /*const SafeArea(child: CredentialsBase())*/
            const SplashScreen());
  }
}
