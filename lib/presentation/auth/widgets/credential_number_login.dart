import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/core/helper/dialog_loading/dialogs_loading.dart';
import 'package:sylph_clothing/presentation/core/widgets/button/eliptical_btn_core.dart';
import 'package:sylph_clothing/presentation/core/widgets/field/form_text_field_core.dart';

class CredentialsNumberLogin extends StatelessWidget {
  const CredentialsNumberLogin({super.key});

  static final _formKeyLogNum = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? logNumber;

    void onLogbyNumber() {
      final vaildate = _formKeyLogNum.currentState!.validate();
      if (vaildate) {
        DialogsLoadingCore.removeMessage(context);
        DialogsLoadingCore.showMessage(context, "You On");
      }
    }

    return Form(
      key: _formKeyLogNum,
      child: Column(
        children: [
          FormTextFieldCore(
              onSave: (inputTxt) {
                logNumber = inputTxt;
              },
              vaildator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    value.trim().length < 13) {
                  return "Please enter a valid 11 number phone";
                }
                return null;
              },
              intValue: "880",
              maxLen: 13,
              iconData: Icons.phone,
              fieldHint: "Phone Number",
              fieldType: TextInputType.number),
          EllipticalBtnCore(onLog: onLogbyNumber, btnTxt: "Login by Number"),
        ],
      ),
    );
  }
}
