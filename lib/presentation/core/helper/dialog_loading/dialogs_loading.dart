import 'package:flutter/material.dart';

import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/core/widgets/loading/loading_widget_core.dart';

class DialogsLoadingCore {
  const DialogsLoadingCore();

  static void showMessage(BuildContext context, String msg,
      {Color? backColor}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: AppColor.kPrimaryColor),
      ),
      backgroundColor: backColor ?? AppColor.kDarkColor,
      behavior: SnackBarBehavior.floating,
    ));
  }

  static void removeMessage(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  static void showProgressBar(BuildContext context, {String? waitingMsg}) {
    showDialog(
      context: context,
      builder: (_) {
        return Center(
            child: LoadingWidgetsCore(
          backgroundColor: Colors.transparent,
          waitingMessage: waitingMsg,
        ));
      },
    );
  }
}
