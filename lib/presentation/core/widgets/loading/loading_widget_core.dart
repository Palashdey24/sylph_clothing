import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';

class LoadingWidgetsCore extends StatelessWidget {
  const LoadingWidgetsCore(
      {super.key, required this.backgroundColor, this.waitingMessage});
  final Color backgroundColor;
  final String? waitingMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LoadingIndicator(
            indicatorType: Indicator.ballRotate,
            colors: const [
              AppColor.kSecondColor,
              AppColor.kLightColor,
              Colors.orange,
              Colors.red,
              Colors.yellow
            ],
            strokeWidth: 5,
            backgroundColor: backgroundColor,
            pathBackgroundColor: Colors.orange),
        if (waitingMessage != null)
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: Text(
              waitingMessage!,
              textAlign: TextAlign.center,
              style: AppFont.bodyMedium(context).copyWith(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
