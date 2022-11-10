import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/view/base_view.dart';
import '../cubit/filter_cubit.dart';

class CityView extends StatelessWidget {
  final List ilIsimleri;
  const CityView({Key? key, required this.ilIsimleri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FilterCubit>(
      cubit: FilterCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (FilterCubit cubit) => Scaffold(
        body: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            return ListView.builder(
              controller: cubit.controllerScrollCity,
          itemCount: ilIsimleri.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                ilIsimleri[index],
              ),
              onTap: () {
                Navigator.pop(context, index);
              },
            );
          });
          },
        ),
      ),
    );
  }
}
