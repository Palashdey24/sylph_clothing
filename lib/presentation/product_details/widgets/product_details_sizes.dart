
import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';

class ProductDetailsSizes extends StatelessWidget {
  const ProductDetailsSizes({super.key, this.productSize, this.selectSizeFn});
  final List<String>? productSize;
  final void Function(String size)? selectSizeFn;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> selectSize = ValueNotifier<String>("N?A");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final size in productSize!)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ValueListenableBuilder(
                valueListenable: selectSize,
                builder: (context, value, child) {
                  return ChoiceChip(
                    selected: value == size ? true : false,
                    elevation: 10,
                    selectedColor: AppColor.kDarkColor,
                    showCheckmark: false,
                    onSelected: (_) {
                      selectSize.value = size;
                      selectSizeFn!(size);
                    },
                    label: Text(
                      size,
                      style: AppFont.bodyMedium(context).copyWith(
                          color: value == size
                              ? AppColor.kPrimaryColor
                              : AppColor.kDarkColor),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
          ),
      ],
    );
  }
}
