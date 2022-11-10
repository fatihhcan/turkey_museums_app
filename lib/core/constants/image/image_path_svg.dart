import '../../extensions/string_extensions.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths get instance {
    return _instance ??= SVGImagePaths.init();
  }

  SVGImagePaths.init();

  final locationIcon = 'location'.toSVG;
  final backArrow = 'back_arrow'.toSVG;
  final notFound = 'not_found'.toSVG;
  final details = 'details'.toSVG;
}
