import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';

class EllipticalBtnCore extends StatelessWidget {
  const EllipticalBtnCore(
      {super.key, required this.onLog, required this.btnTxt});

  final void Function() onLog;
  final String btnTxt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
              backgroundColor: AppColor.kDarkColor,
              foregroundColor: AppColor.kPrimaryColor),
          onPressed: onLog,
          child: Text(btnTxt)),
    );
  }
}
