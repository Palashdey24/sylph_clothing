import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/logo/card_logo_core.dart';
import 'package:sylph_clothing/presentation/auth/widgets/credential_log_divider.dart';
import 'package:sylph_clothing/presentation/auth/widgets/credential_email_log.dart';
import 'package:sylph_clothing/presentation/auth/widgets/credential_number_login.dart';

class LogInScreenPage extends StatelessWidget {
  const LogInScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(AppGap.largeGap),
          const CardLogoCore(),
          const Gap(AppGap.mediumGap),
          Text(
            "Sign In with A Phone Number",
            style: AppFont.bodyMedium(context),
          ),
          const Gap(AppGap.mediumGap),
          const CredentialsNumberLogin(),
          const Gap(AppGap.mediumGap),
          const CredinatialsDivider(),
          const Gap(AppGap.mediumGap),
          Text(
            "Sign In with A Email and Password",
            style: AppFont.bodyMedium(context),
          ),
          const Gap(AppGap.mediumGap),
          const CredentialsEmailLogin(),
        ],
      ),
    );
  }
}
