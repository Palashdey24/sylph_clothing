import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/widgets/field/form_text_field_core.dart';

class ProfileBottomSection extends StatelessWidget {
  const ProfileBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppGap.normalGap, horizontal: AppGap.mediumGap),
      child: Form(
          child: Column(
        children: [
          FormTextFieldCore(
            fillColor: AppColor.kPrimaryColor,
            style: AppFont.bodyMedium(context),
            onSave: (value) {},
            fieldHint: "fieldHint",
            fieldType: TextInputType.text,
            intValue: "Palash Dey",
            vaildator: (value) {
              return null;
            },
            fieldlabel: "Name",
          ),
          const Gap(AppGap.largeGap),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: FormTextFieldCore(
                  fillColor: AppColor.kPrimaryColor,
                  style: AppFont.bodyMedium(context),
                  onSave: (value) {},
                  fieldHint: "Type Gender",
                  fieldType: TextInputType.text,
                  intValue: "Male",
                  vaildator: (value) {
                    return null;
                  },
                  fieldlabel: "Gender",
                ),
              ),
              const Gap(AppGap.normalGap),
              Expanded(
                child: FormTextFieldCore(
                  fillColor: AppColor.kPrimaryColor,
                  style: AppFont.bodyMedium(context),
                  onSave: (value) {},
                  fieldHint: "Add BirthDate",
                  enabled: false,
                  fieldType: TextInputType.text,
                  intValue: "20-06-1995",
                  vaildator: (value) {
                    return null;
                  },
                  fieldlabel: "BirthDate",
                ),
              ),
            ],
          ),
          const Gap(AppGap.largeGap),
          FormTextFieldCore(
            fillColor: AppColor.kPrimaryColor,
            style: AppFont.bodyMedium(context),
            onSave: (value) {},
            fieldHint: "Add Email",
            fieldType: TextInputType.text,
            intValue: "example@gmail.com",
            vaildator: (value) {
              return null;
            },
            fieldlabel: "Email",
          ),
          const Gap(AppGap.largeGap),
          FormTextFieldCore(
            fillColor: AppColor.kPrimaryColor,
            style: AppFont.bodyMedium(context),
            onSave: (value) {},
            fieldHint: "Add Phone Number",
            fieldType: TextInputType.text,
            intValue: "(880) 15643232",
            vaildator: (value) {
              return null;
            },
            fieldlabel: "Phone",
          ),
          const Gap(AppGap.largeGap),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(PhoneSize.deviceWidth(context), 50),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(AppGap.normalGap))),
              child: Text(
                "Updated",
                style: AppFont.bodyMedium(context)
                    .copyWith(color: AppColor.kPrimaryColor),
              )),
        ],
      )),
    );
  }
}
