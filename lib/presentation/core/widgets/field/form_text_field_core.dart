import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';

class FormTextFieldCore extends StatelessWidget {
  const FormTextFieldCore(
      {super.key,
      required this.onSave,
      this.maxLen,
      this.iconData,
      this.fieldlabel,
      required this.fieldHint,
      required this.fieldType,
      this.obsecureTXt,
      this.intValue,
      required this.vaildator,
      this.fillColor,
      this.style,
      this.enabled});

  final IconData? iconData;
  final bool? enabled;
  final TextStyle? style;
  final String? fieldlabel;
  final Color? fillColor;
  final String fieldHint;
  final int? maxLen;
  final TextInputType fieldType;
  final bool? obsecureTXt;
  final String? intValue;
  final FormFieldValidator<String> vaildator;
  final void Function(String value) onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (e) => FocusScope.of(context).unfocus(),
      style: style ?? const TextStyle(color: Colors.black),
      maxLength: maxLen ?? 256,
      keyboardType: fieldType,
      obscureText: obsecureTXt ?? false,
      enabled: enabled ?? true,
      initialValue: intValue,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ??
            AppColor
                .kLightColor, // * Colors.grey.withOpacity(.1) make the text field transparent
        counterText: maxLen == null ? '' : null,
        prefixIcon: iconData != null
            ? Icon(
                iconData,
                color: AppColor.kDarkColor,
              )
            : null,
        floatingLabelStyle: const TextStyle(color: Colors.black),
        label: fieldlabel != null ? Text(fieldlabel!) : null,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.kSecondColor),
            gapPadding: 10,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            gapPadding: 10,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: fieldHint,
      ),
      validator: vaildator,
      onSaved: (newValue) => onSave(newValue!),
    );
  }
}
