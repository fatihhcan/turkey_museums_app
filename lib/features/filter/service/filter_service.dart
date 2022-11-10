import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:turkey_museum_app/core/constants/app/app_constant.dart';
import 'package:turkey_museum_app/features/filter/model/city_model.dart';
import 'package:turkey_museum_app/features/filter/service/IFilterService.dart';
import '../../../core/base/error/dio_exception.dart';
import '../../../core/init/app_state/app_state.dart';
import '../../../core/init/network/dio_client.dart';



class FilterService extends IFilterService {
  FilterService(DioClient client) : super(client);
  List<dynamic> cityList = [];
  @override
  Future<List<dynamic>?> fetchCity() async {
    try {
      
    //String jsonString = await rootBundle.loadString('assets/json/il-ilce.json');
    String jsonString = await rootBundle.loadString(AppConstants.CITY_COUNTY_ASSET);
    
    final jsonResponse = json.decode(jsonString);

    cityList = jsonResponse.map((x) => CityModel.fromJson(x)).toList();
  
      AppStateManager.instance.cityList = cityList;
      return cityList;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
