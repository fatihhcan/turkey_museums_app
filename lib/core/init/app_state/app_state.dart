import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:turkey_museum_app/features/museum/model/museum_model.dart';

String apiAccessToken = dotenv.get("API_ACCESS_TOKEN", fallback: "");
class AppStateManager {
  static AppStateManager? _instance;
  static AppStateManager get instance {
    return _instance ??= AppStateManager.init();
  }

  String accessToken = apiAccessToken;

  List<MuseumModel> museum = [];
  List<MuseumModel> museumIzmir = [];
  List<MuseumModel> museumAnkara = [];
  List<dynamic> cityList = [];


  AppStateManager.init();
}
