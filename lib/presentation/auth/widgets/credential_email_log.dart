import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/button/eliptical_btn_core.dart';
import 'package:sylph_clothing/presentation/core/widgets/field/form_text_field_core.dart';

class CredentialsEmailLogin extends StatefulWidget {
  const CredentialsEmailLogin({super.key});

  @override
  State<CredentialsEmailLogin> createState() => _CredentialsEmailLoginState();
}

class _CredentialsEmailLoginState extends State<CredentialsEmailLogin> {
  String? emailAddress;
  String? logPass;
  final _formKeyLogEmail = GlobalKey<FormState>();

  void onLogbyEmail() {
    _formKeyLogEmail.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyLogEmail,
      child: Column(
        children: [
          FormTextFieldCore(
              vaildator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    value.trim().length < 4 ||
                    !value.trim().contains("@") ||
                    !value.trim().contains(".")) {
                  return "Valid Email Address which contains @ and .";
                }
                return null;
              },
              onSave: (inputTxt) {
                emailAddress = inputTxt;
              },
              iconData: Icons.email_rounded,
              fieldHint: "Email",
              fieldType: TextInputType.text),
          const Gap(AppGap.normalGap),
          FormTextFieldCore(
              vaildator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Password are Empty";
                }
                return null;
              },
              onSave: (inputTxt) {
                logPass = inputTxt;
              },
              obsecureTXt: true,
              iconData: Icons.admin_panel_settings_sharp,
              fieldHint: "Password",
              fieldType: TextInputType.text),
          const Gap(AppGap.normalGap),
          EllipticalBtnCore(onLog: onLogbyEmail, btnTxt: "Login"),
        ],
      ),
    );
  }
}
