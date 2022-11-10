import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turkey_museum_app/core/constants/text_constants.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';

class CustomBox extends StatelessWidget {
  final void Function()? onTapCity;
  final void Function()? onTapCounty;
  final void Function()? onTapSearch;
  final String? city;
  final String? county;

  const CustomBox(
      {super.key,
      required this.onTapCity,
      required this.onTapCounty,
      required this.onTapSearch,
      required this.city,
      required this.county});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 227.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          citySelectButton(context),
         context.sizedBoxNormalVertical,
          countySelectButton(context),
                  context.sizedBoxNormalVertical,

          searchButton(context)
        ],
      ),
    );
  }

  GestureDetector searchButton(BuildContext context) {
    return GestureDetector(
      onTap: onTapSearch,
      child: Container(
        width: 105.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color(0xFF5C5454),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: const Offset(0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            TextConstants.search,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyText2!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  GestureDetector countySelectButton(BuildContext context) {
    return GestureDetector(
      onTap: onTapCounty,
      child: Container(
        width: 220.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: const Color(0xFF707070),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
          county ?? TextConstants.county,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyText2
          ),
        ),
      ),
    );
  }

  GestureDetector citySelectButton(BuildContext context) {
    return GestureDetector(
      onTap: onTapCity,
      child: Container(
        width: 220.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: const Color(0xFF707070),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(city ?? TextConstants.city, style: context.textTheme.bodyText2,textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
