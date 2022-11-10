import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';


class CardsHomeTop extends StatelessWidget {
  final Widget? childTop;
  const CardsHomeTop({super.key, required this.childTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 375.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: context.highadius*1.5, bottomRight: context.highadius*1.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child:childTop,
    );
  }
}
