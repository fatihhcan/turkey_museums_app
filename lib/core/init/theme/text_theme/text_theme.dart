
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class TextThemeManager {
  static TextThemeManager? _instance;
  static TextThemeManager get instance {
    return _instance ??= TextThemeManager.init();
  }

  TextThemeManager.init();

  TextTheme textTheme({bool isDark = false}) {
    return TextTheme(
      headline1: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
  decorationColor: Colors.white.withOpacity(0.01),
      ),
   headline3: TextStyle(
        fontFamily:GoogleFonts.poppins().fontFamily,
        fontSize: 24.sp,
        decoration: TextDecoration.underline,
  decorationColor: Colors.white.withOpacity(0.01),
      ),

      headline4: TextStyle(
        fontFamily:GoogleFonts.poppins().fontFamily,
        fontSize: 20.sp,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w300,

  decorationColor: Colors.white.withOpacity(0.01),
      ),
      headline5: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
  decorationColor: Colors.white.withOpacity(0.01),
      ),


      bodyText1: TextStyle(
        fontFamily:GoogleFonts.poppins().fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
  decorationColor: Colors.white.withOpacity(0.01),
      ),

      subtitle1:  TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
  decorationColor: Colors.white.withOpacity(0.01),
      ),
    );
  }
}
