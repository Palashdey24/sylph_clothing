import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';

class MapSections extends StatefulWidget {
  const MapSections({super.key});

  @override
  State<MapSections> createState() => _MapSectionsState();
}

class _MapSectionsState extends State<MapSections> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 5,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppGap.mediumGap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Choose Locations",
            textAlign: TextAlign.left,
            style: GoogleFonts.stardosStencil().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColor.kLightColor),
          ),
          const Gap(5),
          SizedBox(
            width: PhoneSize.deviceWidth(context) * 0.7,
            height: PhoneSize.deviceHeight(context) * 0.4,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppGap.largeGap)),
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
          const Gap(AppGap.normalGap),
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppGap.mediumGap)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  const Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.deepPurpleAccent,
                      child: FaIcon(
                        FontAwesomeIcons.earthAmericas,
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  ),
                  const Gap(5),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: "Use My Current Location",
                                style: AppFont.bodyMedium(context)),
                            TextSpan(
                                text: "\n\nWhere you live now",
                                style: AppFont.bodySmall(context)
                                    .copyWith(color: AppColor.kLightColor))
                          ]),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.arrowRightToCity,
                          color: AppColor.kDarkColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
