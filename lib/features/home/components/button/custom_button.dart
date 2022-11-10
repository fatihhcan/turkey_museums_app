import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String? title;

  const CustomButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: 225.0.w,
      height: 50.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xFF5C5454),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFF707070),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding:  context.paddingLowVertical,
        child: Text(title!,style: context.textTheme.headline4!.copyWith(color: Colors.white),textAlign: TextAlign.center,),
      ),
      ),
    );
  }
}