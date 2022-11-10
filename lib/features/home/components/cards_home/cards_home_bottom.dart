import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';

class CardsHomeBottom extends StatelessWidget {
  final Widget? childBottom;
  const CardsHomeBottom({super.key, required this.childBottom});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 375.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: context.highadius*1.5, topRight: context.highadius*1.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: childBottom,
    );
  }
}
