import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turkey_museum_app/core/constants/image/image_constants.dart';
import 'package:turkey_museum_app/core/constants/text_constants.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';

class CardMuseum extends StatelessWidget {
  final String? museumTitle;
  final String? museumCity;
  final String? museumCounty;
  final void Function()? onTapDetails;
  const CardMuseum({super.key, required this.museumTitle, required this.museumCity, required this.museumCounty, required this.onTapDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 296.0.w,
      height: 190.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Stack(
        children: [
          backgroundImage(),
          museumInfo(context),
        ],
      ),
    );
  }

  Column museumInfo(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.paddingLowHorizontal,
              child: buildMuseumTitleCityCounty(context),
            ),
            Padding(
              padding: EdgeInsets.only(left: context.highValue * 2.5),
              child: buildDetailsButton(context),
            ),
          ],
        );
  }

  GestureDetector buildDetailsButton(BuildContext context) {
    return GestureDetector(
                onTap: onTapDetails,
                child: Text(
                 TextConstants.details,
                  style: context.textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.appColors.white),
                ),
              );
  }

  Column buildMuseumTitleCityCounty(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    museumTitle ?? "",
                    style: context.textTheme.headline4!
                        .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    '${museumCounty ?? ""} , ${museumCity ?? ""}',
                    style: context.textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.appColors.white),
                  ),
                ],
              );
  }

  Image backgroundImage() {
    return Image.asset(
          ImageConstants.instance.mockBackground,
          height: 345.h,
          fit: BoxFit.fill,
        );
  }
}
