import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';

class CredentialsBottomWidgets extends StatelessWidget {
  const CredentialsBottomWidgets(
      {super.key,
      required this.onChangeCre,
      required this.isSign,
      required this.onGuestFn});
  final void Function() onChangeCre;
  final void Function() onGuestFn;
  final bool isSign;

  @override
  Widget build(BuildContext context) {
    log("we are change");
    return Column(
      children: [
        TextButton(
          onPressed: onChangeCre,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 18, color: AppColor.kDarkColor),
              children: [
                TextSpan(
                    text: isSign ? "New Here? " : "Have Account? ",
                    style: AppFont.bodyMedium(context)),
                TextSpan(
                    text: isSign ? "Create A New One" : "Have you Try Log In!",
                    style: AppFont.bodySmall(context))
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () => onGuestFn(),
          child: const Text(
            "Guest Visit",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
