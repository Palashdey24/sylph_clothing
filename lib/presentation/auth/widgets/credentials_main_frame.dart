import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/auth/pages/log_in_screen_page.dart';
import 'package:sylph_clothing/presentation/auth/pages/sign_up_screen_page.dart';
import 'package:sylph_clothing/presentation/auth/widgets/credentials_bottom_widgets.dart';
import 'package:sylph_clothing/presentation/core/helper/dialog_loading/dialogs_loading.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/home_base/base/home_main_base_with_slider.dart';

class CredentialsMainFrame extends StatelessWidget {
  const CredentialsMainFrame({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLogScreen = ValueNotifier<bool>(true);
    return ValueListenableBuilder(
      valueListenable: isLogScreen,
      builder: (context, value, child) {
        return Column(
          children: [
            AnimatedCrossFade(
                firstChild: const LogInScreenPage(),
                secondChild: const SignUpScreenPage(),
                crossFadeState: isLogScreen.value
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500)),
            CredentialsBottomWidgets(
                onChangeCre: () {
                  isLogScreen.value = !isLogScreen.value;
                },
                isSign: isLogScreen.value,
                onGuestFn: () {
                  DialogsLoadingCore.showProgressBar(context);
                  AppNavigator.navigatorReplace(
                      context, const HomeMainBaseWithSlider());
                })
          ],
        );
      },
    );
  }
}
