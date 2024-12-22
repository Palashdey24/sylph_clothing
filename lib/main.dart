import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sylph_clothing/presentation/config/theme/app_theme.dart';
import 'package:sylph_clothing/presentation/splash/splash_screen.dart';

void main() {
  //! this debut paint for repaint boundary
  //debugRepaintRainbowEnabled = true;

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      tools: const [
        DeviceSection(
          model: true, // Let them switch devices
          orientation: false, // Keep it simple
          frameVisibility: false, // Clean presentation
          virtualKeyboard: false, // Focus on the UI
        ),
      ],
      devices: [
        // ... Devices.all, // uncomment to see all devices

        // Popular Android Devices
        Devices.android.samsungGalaxyA50, // Mid-range
        Devices.android.samsungGalaxyNote20, // Large screen
        Devices.android.samsungGalaxyS20, // Flagship
        Devices.android.samsungGalaxyNote20Ultra, // Premium
        Devices.android.onePlus8Pro, // Different aspect ratio
        Devices.android.sonyXperia1II, // Tall screen

        // Popular iOS Devices
        Devices.ios.iPhoneSE, // Small screen
        Devices.ios.iPhone12, // Standard size
        Devices.ios.iPhone12Mini, // Compact
        Devices.ios.iPhone12ProMax, // Large
        Devices.ios.iPhone13, // Latest standard
        Devices.ios.iPhone13ProMax, // Latest large
        Devices.ios.iPhone13Mini, // Latest compact
        Devices.ios.iPhoneSE, // Budget option
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
