import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';

class ProductDetailsPriceReview extends StatelessWidget {
  const ProductDetailsPriceReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Review",
                style: AppFont.bodyMedium(context)
                    .copyWith(color: AppColor.kSecondColor),
              ),
              const Gap(5),
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                maxRating: 5,
                itemCount: 5,
                allowHalfRating: true,
                itemSize: 20,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                ignoreGestures: true,
                onRatingUpdate: (_) {},
              ),
              Text(
                " (4.5)",
                style: AppFont.bodySmall(context)
                    .copyWith(color: AppColor.kLightColor),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "৳699 ",
                  style: AppFont.bodyMedium(context)
                      .copyWith(color: AppColor.kDarkColor),
                ),
                TextSpan(
                  text: "\n৳899 ",
                  style: AppFont.bodySmall(context).copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 2),
                  children: [
                    TextSpan(
                      text: "Save ৳200",
                      style: AppFont.bodySmall(context).copyWith(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
