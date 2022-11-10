
import 'package:get_it/get_it.dart';
import 'package:turkey_museum_app/features/museum/cubit/museum_cubit.dart';

import '../../../features/filter/cubit/filter_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(() =>  FilterCubit());
  locator.registerLazySingleton(() =>  const FilterState());
  locator.registerLazySingleton(() =>  MuseumCubit());
 

}
