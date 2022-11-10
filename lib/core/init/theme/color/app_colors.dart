import 'package:flutter/material.dart';

import 'package:turkey_museum_app/core/extensions/string_extensions.dart';

abstract class AppColors {
  //Unique Colors

  Color white = 'FFFFFF'.color;
  Color shark = '1C1C1D'.color;
  Color tundora = '464646'.color;
  Color alto = 'DCDCDC'.color;

  //Overrided Colors

  late Color scaffoldBackgroundColor;
  late Color homeViewBackgroundColor;
  late Color museumCardBackgroundColor;
  late Color subtitleColor;
}

class LightColors extends AppColors {
  @override
  Color get scaffoldBackgroundColor => white;

  @override
  Color get homeViewBackgroundColor => alto;

  @override
  Color get museumCardBackgroundColor => shark;

    @override
  Color get subtitleColor => tundora;
}

class DarkColors extends AppColors {
  @override
  Color get scaffoldBackgroundColor => white;
}
