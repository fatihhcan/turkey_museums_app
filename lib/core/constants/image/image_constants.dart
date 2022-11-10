class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    return _instance ??= ImageConstants._init();
  }

  ImageConstants._init();



String get mockBackground => toPng('mock_background');
String get mockDetailsBackground => toPng('mock_background_map');


  String toPng(String name) => 'assets/images/$name.png';
}
