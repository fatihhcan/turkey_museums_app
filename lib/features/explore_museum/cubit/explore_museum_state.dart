part of 'explore_museum_cubit.dart';


@immutable
class ExploreMuseumState extends Equatable {
  final List<MuseumModel>? museum;
  final List<MuseumModel>? museumIzmir;
  final List<MuseumModel>? museumAnkara;
  final List<MuseumModel>? museumAntalya;
  final List<MuseumModel>? museumIstanbul;
  final List<MuseumModel>? museumBursa;
  final bool museumFetchLoading;
  final bool museumFetchLoadingAnkara;
  final bool museumFetchLoadingIzmir;
  final bool museumFetchLoadingAntalya;
  final bool museumFetchLoadingIstanbul;
  final bool museumFetchLoadingBursa;

  const ExploreMuseumState({this.museum,this.museumFetchLoading=false, this.museumAnkara, this.museumIzmir, this.museumFetchLoadingAnkara =false, this.museumFetchLoadingIzmir=false, this.museumFetchLoadingAntalya = false, this.museumFetchLoadingBursa = false, this.museumFetchLoadingIstanbul = false, this.museumAntalya, this.museumBursa, this.museumIstanbul});
  @override
  List<Object?> get props => [museum, museumFetchLoading, museumAnkara, museumIzmir, museumFetchLoadingAnkara, museumFetchLoadingIzmir, museumFetchLoadingAntalya, museumFetchLoadingIstanbul, museumFetchLoadingBursa, museumAntalya, museumBursa, museumIstanbul];

  ExploreMuseumState copyWith({
    List<MuseumModel>? museum,
    List<MuseumModel>? museumAnkara,
    List<MuseumModel>? museumIzmir,
    List<MuseumModel>? museumIstanbul,
    List<MuseumModel>? museumAntalya,
    List<MuseumModel>? museumBursa,
    bool? museumFetchLoading,
    bool? museumFetchLoadingAnkara,
    bool? museumFetchLoadingIzmir,
    bool? museumFetchLoadingIstanbul,
    bool? museumFetchLoadingAntalya,
    bool? museumFetchLoadingBursa,
  }) {
    return ExploreMuseumState(
      museum: museum ?? this.museum,
      museumFetchLoading: museumFetchLoading ?? this.museumFetchLoading,
      museumAnkara: museumAnkara ?? this.museumAnkara,
      museumIzmir: museumIzmir ?? this.museumIzmir,
      museumFetchLoadingAnkara: museumFetchLoadingAnkara ?? this.museumFetchLoadingAnkara,
      museumFetchLoadingIzmir: museumFetchLoadingIzmir ?? this.museumFetchLoadingIzmir,
      museumFetchLoadingIstanbul: museumFetchLoadingIstanbul ?? this.museumFetchLoadingIstanbul,
      museumFetchLoadingAntalya: museumFetchLoadingAntalya ?? this.museumFetchLoadingAntalya,
      museumFetchLoadingBursa: museumFetchLoadingBursa ?? this.museumFetchLoadingBursa,
      museumAntalya: museumAntalya ?? this.museumAntalya,
      museumBursa: museumBursa ?? this.museumBursa,
      museumIstanbul: museumIstanbul ?? this.museumIstanbul
    );
  }
}
