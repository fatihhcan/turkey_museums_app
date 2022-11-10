import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/base/cubit/base_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseCubit {
  HomeCubit() : super(const HomeState());


  @override
  void init() {

  }

  @override
  void setContext(BuildContext context) {}

  void navigateToView({required String navigationPath}) {
    navigation.navigateToPageClear(path: navigationPath);
  }

}
