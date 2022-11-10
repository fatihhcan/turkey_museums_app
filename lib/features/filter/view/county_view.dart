import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/view/base_view.dart';
import '../cubit/filter_cubit.dart';

class CountyView extends StatelessWidget {
 
  final List ilceIsimleri;
  const CountyView({Key? key, required this.ilceIsimleri}) : super(key: key);

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
              controller: cubit.controllerScrollCounty,
          itemCount: ilceIsimleri.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                ilceIsimleri[index],
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
