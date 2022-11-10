import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:turkey_museum_app/features/museum/service/museum_service.dart';
import '../../../core/base/cubit/base_cubit.dart';
import '../../../core/init/app_state/app_state.dart';
import '../../museum/model/museum_model.dart';

part 'explore_museum_state.dart';

class ExploreMuseumCubit extends Cubit<ExploreMuseumState> with BaseCubit {
  ExploreMuseumCubit() : super(const ExploreMuseumState());
  late MuseumService museumService;
  late ScrollController controllerScrollExploreMuseumView;
  late ScrollController controllerScrollAnkara;
  late ScrollController controllerScrollIzmir;
  late ScrollController controllerScrollIstanbul;
  late ScrollController controllerScrollBursa;
  late ScrollController controllerScrollAntalya;
  List<MuseumModel> allMuseumIzmir = [];
  List<MuseumModel> allMuseumAnkara = [];
  List<MuseumModel> allMuseumIstanbul = [];
  List<MuseumModel> allMuseumAntalya = [];
  List<MuseumModel> allMuseumBursa = [];

  @override
  void init() {
    initService();
    fetchMuseumExplore();
  }

  @override
  void setContext(BuildContext context) {}

  void initService() {
    museumService = MuseumService(dioManager.MuseumNetworkClient);
    controllerScrollExploreMuseumView = ScrollController();
    controllerScrollAnkara = ScrollController();
    controllerScrollIzmir = ScrollController();
    controllerScrollIstanbul = ScrollController();
    controllerScrollBursa = ScrollController();
    controllerScrollAntalya = ScrollController();
  }

  Future<void> fetchMuseumAnkara() async {
    museumFetchLoadingAnkara(true);
    await museumService.fetchMuseum('ankara', '');
    allMuseumAnkara = AppStateManager.instance.museum;
    emit(state.copyWith(museumAnkara: allMuseumAnkara));
    museumFetchLoadingAnkara(false);
  }

  Future<void> fetchMuseumIzmir() async {
    museumFetchLoadingIzmir(true);
    await museumService.fetchMuseum('izmir', '');
    allMuseumIzmir = AppStateManager.instance.museum;
    emit(state.copyWith(museumIzmir: allMuseumIzmir));
    museumFetchLoadingIzmir(false);
  }

  Future<void> fetchMuseumIstanbul() async {
    museumFetchLoadingIstanbul(true);
    await museumService.fetchMuseum('istanbul', '');
    allMuseumIstanbul = AppStateManager.instance.museum;
    emit(state.copyWith(museumIstanbul: allMuseumIstanbul));
    museumFetchLoadingIstanbul(false);
  }

  Future<void> fetchMuseumAntalya() async {
    museumFetchLoadingAntalya(true);
    await museumService.fetchMuseum('antalya', '');
    allMuseumAntalya = AppStateManager.instance.museum;
    emit(state.copyWith(museumAntalya: allMuseumAntalya));
    museumFetchLoadingAntalya(false);
  }

  Future<void> fetchMuseumBursa() async {
    museumFetchLoadingBursa(true);
    await museumService.fetchMuseum('bursa', '');
    allMuseumBursa = AppStateManager.instance.museum;
    emit(state.copyWith(museumBursa: allMuseumBursa));
    museumFetchLoadingBursa(false);
  }

  Future<void> fetchMuseumExplore() async {
    museumFetchLoading(true);
    await fetchMuseumAnkara();
    await fetchMuseumIzmir();
    await fetchMuseumIstanbul();
    await fetchMuseumAntalya();
    await fetchMuseumBursa();
    museumFetchLoading(false);
  }

  void museumFetchLoading(bool loading) {
    emit(state.copyWith(museumFetchLoading: loading));
  }

  void museumFetchLoadingAnkara(bool loading) {
    emit(state.copyWith(museumFetchLoadingAnkara: loading));
  }

  void museumFetchLoadingIzmir(bool loading) {
    emit(state.copyWith(museumFetchLoadingIzmir: loading));
  }

  void museumFetchLoadingIstanbul(bool loading) {
    emit(state.copyWith(museumFetchLoadingIstanbul: loading));
  }

  void museumFetchLoadingAntalya(bool loading) {
    emit(state.copyWith(museumFetchLoadingAntalya: loading));
  }

  void museumFetchLoadingBursa(bool loading) {
    emit(state.copyWith(museumFetchLoadingBursa: loading));
  }

  void navigateToView({required String navigationPath, Object? data}) {
    navigation.navigateToPage(path: navigationPath, data: data);
  }
    void navigatPop() {
    navigation.pop();
  }


  @override
  Future<void> close() {

    return super.close();
  }
}
