import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';
import 'color/app_colors.dart';
import 'text_theme/text_theme.dart';

class AppThemeManager extends AppTheme {
  static AppThemeManager? _instance;
  static AppThemeManager get instance {
    return _instance ??= AppThemeManager._init();
  }

  AppThemeManager._init();

  @override
  ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColors().white,
      backgroundColor: LightColors().white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextThemeManager.instance.textTheme(),
          appBarTheme: buildAppBarTheme(LightColors().white, LightColors().white,),
     );


  AppBarTheme buildAppBarTheme(Color textColor, Color backgroundColor) {
    return AppBarTheme(
      centerTitle: false,
      backgroundColor: backgroundColor,
      
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 20,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white.withOpacity(0.01),
      ),
      actionsIconTheme: IconThemeData(
        color: textColor,
      ),
      elevation: 0,
    );
  }
}
