import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diacritic/diacritic.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:turkey_museum_app/core/init/di/locator.dart';
import 'package:turkey_museum_app/features/filter/cubit/filter_cubit.dart';
import 'package:turkey_museum_app/features/museum/service/museum_service.dart';
import '../../../core/base/cubit/base_cubit.dart';
import '../../../core/init/app_state/app_state.dart';
import '../model/museum_model.dart';

part 'museum_state.dart';

class MuseumCubit extends Cubit<MuseumState> with BaseCubit {
  MuseumCubit() : super(const MuseumState());
  late MuseumService museumService;
  late ScrollController? controllerScrollMuseumView;
  late ScrollController? controllerScrollMuseumDetailView;
  List<MuseumModel> allMuseum = [];

  @override
  void init() {
    initService();
    fetchMuseum();
  }

  @override
  void setContext(BuildContext context) {}

  void initService() {
    museumService = MuseumService(dioManager.MuseumNetworkClient);
    controllerScrollMuseumView = ScrollController();
    controllerScrollMuseumDetailView = ScrollController();
  }

  Future<void> fetchMuseum() async {
    museumFetchLoading(true);
    await museumService.fetchMuseum(
        turkishCharacterRemove(0)!, turkishCharacterRemove(1)!);
    allMuseum = AppStateManager.instance.museum;
    emit(state.copyWith(museum: allMuseum));
    log("city ${turkishCharacterRemove(0)!} ");
    log("county ${turkishCharacterRemove(1)!} ");
    museumFetchLoading(false);
  }

  String? turkishCharacterRemove(int turkishValue) {
    switch (turkishValue) {
      case 0:
        return removeDiacritics(locator<FilterCubit>().isSelectedCity);
      case 1:
        return removeDiacritics(locator<FilterCubit>().isSelectedCounty);
      default:
        return removeDiacritics(locator<FilterCubit>().isSelectedCity);
    }
  }

  void museumFetchLoading(bool loading) {
    emit(state.copyWith(museumFetchLoading: loading));
  }

  void navigateToView({required String navigationPath, Object? data}) {
    navigation.navigateToPageClear(path: navigationPath, data: data);
  }

  void navigateToPop() {
    navigation.pop();
  }

  @override
  Future<void> close() {
    controllerScrollMuseumView!.dispose();
    controllerScrollMuseumDetailView!.dispose();
    return super.close();
  }
}
