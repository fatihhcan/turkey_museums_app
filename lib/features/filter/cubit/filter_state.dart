part of 'filter_cubit.dart';

@immutable
class FilterState extends Equatable {
  final bool cityCountyFetchLoading;
  final String? selectCity;
   final String? selectCounty;

  const FilterState({this.cityCountyFetchLoading = false, this.selectCity, this.selectCounty});
  @override
  List<Object?> get props => [cityCountyFetchLoading, selectCity, selectCounty];

  FilterState copyWith({
    bool? cityCountyFetchLoading,
    String? selectCity,
    String? selectCounty,
  }) {
    return FilterState(
        cityCountyFetchLoading:
            cityCountyFetchLoading ?? this.cityCountyFetchLoading,
            
         selectCity: selectCity ?? this.selectCity,
         selectCounty: selectCounty ?? this.selectCounty);
  }
}
