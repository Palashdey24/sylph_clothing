import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';
import 'package:sylph_clothing/presentation/profile/widgets/profile_bottom_section.dart';
import 'package:sylph_clothing/presentation/profile/widgets/profile_top_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: PhoneSize.deviceWidth(context),
          height: PhoneSize.deviceHeight(context),
          child: ListView(
            children: const [
              CustomeTopBarCore(
                barTittle: "Profile",
              ),
              ProfileTopSection(),
              Gap(AppGap.normalGap),
              ProfileBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
