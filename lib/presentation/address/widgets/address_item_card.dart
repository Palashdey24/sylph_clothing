
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';

class AddressItemCard extends StatelessWidget {
  const AddressItemCard({super.key, this.defaultCard});
  final bool? defaultCard;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          color: AppColor.kPrimaryColor,
          margin: const EdgeInsets.only(bottom: 5, top: AppGap.mediumGap),
          elevation: defaultCard != null ? 5 : 2,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: defaultCard != null ? 2 : 0,
                  color:
                      defaultCard != null ? Colors.lime : Colors.transparent),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppGap.normalGap))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppGap.mediumGap, vertical: AppGap.normalGap),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppGap.normalGap),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.teal, width: 3)),
                      child: const FaIcon(
                        size: 30,
                        FontAwesomeIcons.briefcase,
                        color: AppColor.kDarkColor,
                      ),
                    ),
                    const Gap(AppGap.mediumGap),
                    Text(
                      "Office",
                      textAlign: TextAlign.center,
                      style: AppFont.bodyLarge(context).copyWith(fontSize: 15),
                    ),
                  ],
                ),
                const Gap(AppGap.normalGap),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Yusuf Mansion 4491/A, Yusuf Mansion 4491/A, Opposite Shadnitah Complex,Opposite Shadnitah Complex, Chandgaon,Chittagong, Bangladesh",
                              style: AppFont.bodyMedium(context)
                                  .copyWith(fontSize: 12),
                            ),
                            const Gap(AppGap.normalGap),
                            Text(
                              "+88 01673756308",
                              textAlign: TextAlign.start,
                              style: AppFont.bodySmall(context),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            shape: const CircleBorder(),
                            child: GoogleMap(
                                mapType: MapType.normal,
                                zoomControlsEnabled: false,
                                markers: {
                                  const Marker(
                                    markerId: MarkerId('Sydney'),
                                    position: LatLng(-33.86, 151.20),
                                  )
                                },
                                initialCameraPosition: _kGooglePlex),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        if (defaultCard != null)
          Positioned(
            top: 0,
            right: 0,
            child: Card(
              color: Colors.blueGrey,
              margin: const EdgeInsets.only(top: 5),
              shape: const BeveledRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(5))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                child: Text(
                  "Default",
                  style: AppFont.bodySmall(context)
                      .copyWith(color: AppColor.kPrimaryColor),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
