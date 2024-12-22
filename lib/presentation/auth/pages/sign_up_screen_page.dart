import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/button/eliptical_btn_core.dart';
import 'package:sylph_clothing/presentation/core/widgets/field/form_text_field_core.dart';
import 'package:sylph_clothing/presentation/core/widgets/logo/card_logo_core.dart';

class SignUpScreenPage extends StatelessWidget {
  const SignUpScreenPage({super.key});

  static final GlobalKey<FormState> _formKeySign = GlobalKey<FormState>();
  static void onSignUp() {
    _formKeySign.currentState!.validate();
  }

  static String? onFirstNameValid(String value) {
    if (value.trim().isEmpty || value.trim().length < 2) {
      return "Please add First Name";
    }
    return null;
  }

  static String? onLastNameValid(String value) {
    if (value.trim().isEmpty || value.trim().length < 2) {
      return "Please add Last Name";
    }
    return null;
  }

  static String? onPhoneValid(String value) {
    if (value.trim().isEmpty || value.trim().length < 11) {
      return "Please enter a valid 11 number phone";
    }
    return null;
  }

  static String? onEmailValid(String value) {
    if (value.trim().isEmpty ||
        value.trim().length < 4 ||
        !value.trim().contains("@") ||
        !value.trim().contains(".")) {
      return "Valid Email Address which contains @ and .";
    }
    return null;
  }

  static String? onPasswordValid(String value) {
    if (value.trim().isEmpty ||
        value.trim().length < 4 ||
        !value.trim().contains("@") ||
        !value.trim().contains(".")) {
      return "Valid Email Address which contains @ and .";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeySign,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 100, left: AppGap.largeGap + 10, right: AppGap.largeGap + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(AppGap.mediumGap),
            const Center(child: CardLogoCore()),
            Text(
              "Profile Details",
              style: AppFont.bodyMedium(context),
            ),
            const Gap(AppGap.mediumGap),
            FormTextFieldCore(
              onSave: (value) {},
              fieldHint: "First Name",
              fieldType: TextInputType.text,
              vaildator: (value) => onFirstNameValid(value!),
            ),
            const Gap(AppGap.normalGap),
            FormTextFieldCore(
              onSave: (value) {},
              fieldHint: "Last Name",
              fieldType: TextInputType.text,
              vaildator: (value) => onLastNameValid(value!),
            ),
            const Gap(AppGap.largeGap),
            Text(
              "Account Details",
              style: AppFont.bodyMedium(context),
            ),
            const Gap(AppGap.mediumGap),
            FormTextFieldCore(
              onSave: (value) {},
              maxLen: 11,
              fieldHint: "Phone",
              fieldType: TextInputType.number,
              vaildator: (value) => onPhoneValid(value!),
            ),
            const Gap(AppGap.normalGap),
            FormTextFieldCore(
              onSave: (value) {},
              fieldHint: "Email",
              fieldType: TextInputType.text,
              vaildator: (value) => onEmailValid(value!),
            ),
            const Gap(AppGap.normalGap),
            FormTextFieldCore(
              onSave: (value) {},
              fieldHint: "Password",
              fieldType: TextInputType.text,
              obsecureTXt: true,
              vaildator: (value) => onPasswordValid(value!),
            ),
            const Gap(AppGap.largeGap),
            const EllipticalBtnCore(onLog: onSignUp, btnTxt: "Sign Up"),
          ],
        ),
      ),
    );
  }
}
