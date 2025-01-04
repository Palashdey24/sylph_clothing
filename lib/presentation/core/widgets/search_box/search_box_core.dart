import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';

class SearchBoxCore extends StatelessWidget {
  const SearchBoxCore({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PhoneSize.deviceWidth(context) * 0.95,
      height: 64,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(13.0),
              bottomLeft: Radius.circular(13.0),
              topLeft: Radius.circular(13.0),
              topRight: Radius.circular(13.0),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    style: const TextStyle(
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: AppColor.kDarkColor,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Search for Product',
                      border: InputBorder.none,
                      helperStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColor.kDarkColor,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        color: AppColor.kLightColor,
                      ),
                    ),
                    onEditingComplete: () {},
                  ),
                ),
              ),
              const SizedBox(
                width: 60,
                height: 60,
                child: Icon(Icons.search, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
