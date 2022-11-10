import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:turkey_museum_app/features/filter/service/filter_service.dart';
import 'package:turkey_museum_app/features/filter/view/city_view.dart';
import 'package:turkey_museum_app/features/filter/view/county_view.dart';
import '../../../core/base/cubit/base_cubit.dart';
import '../../../core/init/app_state/app_state.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> with BaseCubit {
  FilterCubit() : super(const FilterState());

  List<dynamic> cityList = [];
  List<String> cityNameList = [];
  List<String> countyNameList = [];

  int isSelectCityIndex = 0;
  int isSelectCountyIndex = 0;

  String isSelectedCity = "";
  String isSelectedCounty = "";
  late FilterService filterService;
  late ScrollController controllerScrollCity;
  late ScrollController controllerScrollCounty;

  @override
  void init() {
    initService();
  }

  @override
  void setContext(BuildContext context) {}

  void initService() async {
    controllerScrollCity = ScrollController();
    controllerScrollCounty = ScrollController();
    filterService = FilterService(dioManager.MuseumNetworkClient);
    await fetchCity();
    fetchCityNames();
    fetchCity().then((value) => fetchCityNames());
  }

  Future<void> fetchCity() async {
    cityCountyFetchLoading(true);
    await filterService.fetchCity();
    cityList = AppStateManager.instance.cityList;
    cityCountyFetchLoading(false);
  }

  void fetchCityNames() {
    cityCountyFetchLoading(true);
    cityNameList = [];
    for (var element in cityList) {
      cityNameList.add(element.ilAdi);
    }
    cityCountyFetchLoading(false);
  }

  void cityCountyFetchLoading(bool loading) {
    emit(state.copyWith(cityCountyFetchLoading: loading));
  }

  void selectedCityCounty(String selectCity) {
    countyNameList = [];
    for (var element in cityList) {
      if (element.ilAdi == selectCity) {
        element.ilceler.forEach((element) {
          countyNameList.add(element.ilceAdi);
        });
      }
    }

    emit(state.copyWith(selectCounty: "İlçe"));
    isSelectedCounty = '';
  }

  Future<void> navigateCitySelect(BuildContext context) async {
    if (!state.cityCountyFetchLoading) {
      isSelectCityIndex = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CityView(ilIsimleri: cityNameList),
        ),
      );

      isSelectedCity = cityNameList[isSelectCityIndex];
     // print(isSelectedCity);
    //  print(isSelectedCounty);

      emit(state.copyWith(selectCity: cityNameList[isSelectCityIndex]));
      selectedCityCounty(cityList[isSelectCityIndex].toString());
    }
  }

  Future<void> navigateCountySelect(BuildContext context) async {
    selectedCityCounty(cityNameList[isSelectCityIndex]);
    isSelectCountyIndex = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountyView(ilceIsimleri: countyNameList),
      ),
    );

    isSelectedCounty = countyNameList[isSelectCountyIndex];
    emit(state.copyWith(selectCounty: countyNameList[isSelectCountyIndex]));
  }

  void navigateToView({required String navigationPath}) {
    navigation.navigateToPageClear(path: navigationPath);
  }

  void navigatePop() {
    navigation.pop();
  }

  @override
  Future<void> close() {
    controllerScrollCity.dispose();
    controllerScrollCounty.dispose();

    return super.close();
  }
}
