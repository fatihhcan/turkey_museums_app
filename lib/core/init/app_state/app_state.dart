//import 'package:cep_trafik_mobile/feature/announcements/model/announcements_model.dart';


class AppStateManager {
  static AppStateManager? _instance;
  static AppStateManager get instance {
    return _instance ??= AppStateManager.init();
  }

  bool isDevelop = true;
  String accessToken = '';

  //List<AnnouncementsModel> announcements = [];


  AppStateManager.init();
}
