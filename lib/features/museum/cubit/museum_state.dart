part of 'museum_cubit.dart';


@immutable
class MuseumState extends Equatable {
  final List<MuseumModel>? museum;
  final List<MuseumModel>? museumIzmir;
  final List<MuseumModel>? museumAnkara;
  final bool museumFetchLoading;

  const MuseumState({this.museum,this.museumFetchLoading=false, this.museumAnkara, this.museumIzmir});
  @override
  List<Object?> get props => [museum, museumFetchLoading, museumAnkara, museumIzmir];

  MuseumState copyWith({
    List<MuseumModel>? museum,
    List<MuseumModel>? museumAnkara,
    List<MuseumModel>? museumIzmir,
    bool? museumFetchLoading,
  }) {
    return MuseumState(
      museum: museum ?? this.museum,
      museumFetchLoading: museumFetchLoading ?? this.museumFetchLoading,
      museumAnkara: museumAnkara ?? this.museumAnkara,
      museumIzmir: museumIzmir ?? this.museumIzmir
    );
  }
}
