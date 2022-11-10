part of 'home_cubit.dart';


@immutable
class HomeState extends Equatable {

  final bool museumFetchLoading;

  const HomeState({this.museumFetchLoading=false});
  @override
  List<Object?> get props => [ museumFetchLoading];

  HomeState copyWith({
   
    bool? museumFetchLoading,
  }) {
    return HomeState(
   
      museumFetchLoading: museumFetchLoading ?? this.museumFetchLoading
    );
  }
}
