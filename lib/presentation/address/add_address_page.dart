import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/address/widgets/map_sections.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/widgets/custome/custome_top_bar_core.dart';
import 'package:sylph_clothing/presentation/core/widgets/field/form_text_field_core.dart';

final addressLabel = [
  ["Home", FontAwesomeIcons.house, Colors.lime],
  ["Work", FontAwesomeIcons.briefcase, Colors.deepPurpleAccent],
  ["Partner", FontAwesomeIcons.solidHandshake, Colors.orange],
  ["Relative", FontAwesomeIcons.creativeCommonsBy, Colors.blueGrey],
  ["Other", FontAwesomeIcons.solidSquareCaretDown, Colors.greenAccent],
];

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> selectLabel = ValueNotifier("");
    return ColoredBox(
      color: AppColor.kPrimaryColor,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomeTopBarCore(
                barTittle: "New Address",
              ),
              const Gap(AppGap.normalGap),
              const MapSections(),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppGap.normalGap,
                    right: AppGap.normalGap,
                    bottom: 20),
                child: Column(
                  children: [
                    const Gap(AppGap.normalGap),
                    Form(
                        child: Column(
                      children: [
                        const Gap(AppGap.normalGap),
                        FormTextFieldCore(
                          onSave: (value) {},
                          fieldHint: "Landmark",
                          maxLen: 120,
                          iconData: FontAwesomeIcons.placeOfWorship,
                          fillColor: AppColor.kPrimaryColor,
                          fieldType: TextInputType.text,
                          vaildator: (value) {
                            return null;
                          },
                          fieldlabel: "Landmark*",
                          intValue: " ",
                        ),
                        const Gap(AppGap.mediumGap),
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: FormTextFieldCore(
                                onSave: (value) {},
                                fieldHint: "Add Name",
                                fillColor: AppColor.kPrimaryColor,
                                fieldType: TextInputType.text,
                                vaildator: (value) {
                                  return null;
                                },
                                fieldlabel: "Floor*",
                                intValue: " ",
                              ),
                            ),
                            const Gap(5),
                            Expanded(
                              child: FormTextFieldCore(
                                onSave: (value) {},
                                fieldHint: "Flat No*",
                                fillColor: AppColor.kPrimaryColor,
                                fieldType: TextInputType.text,
                                vaildator: (value) {
                                  return null;
                                },
                                fieldlabel: "Flat No*",
                                intValue: " ",
                              ),
                            ),
                          ],
                        ),
                        const Gap(AppGap.mediumGap),
                        FormTextFieldCore(
                          onSave: (value) {},
                          fieldHint: "Add Name",
                          fillColor: AppColor.kPrimaryColor,
                          fieldType: TextInputType.text,
                          vaildator: (value) {
                            return null;
                          },
                          fieldlabel: "Name*",
                          intValue: " ",
                        ),
                        const Gap(AppGap.mediumGap),
                        const Gap(AppGap.mediumGap),
                        FormTextFieldCore(
                          onSave: (value) {},
                          fieldHint: "Add Number",
                          fillColor: AppColor.kPrimaryColor,
                          fieldType: TextInputType.text,
                          vaildator: (value) {
                            return null;
                          },
                          fieldlabel: "Number*",
                          intValue: " ",
                        ),
                        const Gap(AppGap.mediumGap),
                        FormTextFieldCore(
                          onSave: (value) {},
                          fieldHint: "E.g Drop at door, Don't ring bell",
                          fillColor: AppColor.kPrimaryColor,
                          fieldType: TextInputType.text,
                          vaildator: (value) {
                            return null;
                          },
                          fieldlabel: "Delivery Note",
                        ),
                        const Gap(AppGap.mediumGap),
                        Card(
                          color: const Color(0xffFFFFF0),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppGap.mediumGap,
                                vertical: AppGap.normalGap),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Add A Label",
                                  textAlign: TextAlign.start,
                                  style: AppFont.bodyMedium(context).copyWith(),
                                ),
                                const Gap(5),
                                Center(
                                  child: ValueListenableBuilder(
                                      valueListenable: selectLabel,
                                      builder: (context, value, child) {
                                        return Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            for (final label in addressLabel)
                                              GestureDetector(
                                                onTap: () => selectLabel.value =
                                                    label[0] as String,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      AppGap.normalGap),
                                                  child: Column(
                                                    children: [
                                                      Card(
                                                        color: (selectLabel
                                                                    .value ==
                                                                label[0]
                                                                    as String)
                                                            ? AppColor
                                                                .kDarkColor
                                                            : null,
                                                        shape: RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                                color: AppColor
                                                                    .kDarkColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          child: FaIcon(
                                                            label[1]
                                                                as IconData,
                                                            color: label[2]
                                                                as Color,
                                                          ),
                                                        ),
                                                      ),
                                                      const Gap(5),
                                                      Text(
                                                        label[0] as String,
                                                        style:
                                                            AppFont.bodySmall(
                                                                context),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                          ],
                                        );
                                      }),
                                ),
                                const Gap(AppGap.normalGap),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Save Address",
                                      style: AppFont.bodyMedium(context)
                                          .copyWith(
                                              color: AppColor.kPrimaryColor),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
