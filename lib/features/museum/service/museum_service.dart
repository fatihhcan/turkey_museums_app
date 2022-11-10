import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:turkey_museum_app/features/museum/model/museum_model.dart';
import '../../../core/base/error/dio_exception.dart';
import '../../../core/constants/enums/network_routes.dart';
import '../../../core/init/app_state/app_state.dart';
import '../../../core/init/network/dio_client.dart';
import '../../../core/utility/api_response.dart';
import 'IMuseumService.dart';

class MuseumService extends IMuseumService {
  MuseumService(DioClient client) : super(client);
  @override
  Future<List<MuseumModel>?> fetchMuseum(String city, String county) async {
    try {
      //getMuseum?city=izmir&county=Konak
     // city = "izmir";
    ///  county = "konak";
      var response = await client
          .get('${NetWorkRoutes.MUSEUM.value}city=$city&county=$county');
      if (response is String) {
        response = json.decode(response);
      }
      final result = ResponseParser<MuseumModel>(response: response["data"])
          .fromList<List<MuseumModel>>(model: MuseumModel());
      AppStateManager.instance.museum = result ?? [];
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
