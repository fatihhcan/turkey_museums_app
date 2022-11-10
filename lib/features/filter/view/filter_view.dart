import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';
import 'package:turkey_museum_app/features/filter/components/custom_box.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/constants/enums/navigation_routes.dart';
import '../../../core/constants/image/image_path_svg.dart';
import '../../../core/constants/text_constants.dart';
import '../../../core/init/di/locator.dart';
import '../cubit/filter_cubit.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FilterCubit>(
      cubit: locator<FilterCubit>(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (FilterCubit cubit) => Scaffold(
         backgroundColor: context.appColors.alto,
         appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              TextConstants.searchMuseum,
              style: context.textTheme.headline1!.copyWith(color: Colors.black),
            ),
            actions: [
              GestureDetector(
                  onTap: () =>  cubit.navigateToView(navigationPath: NavigationConstants.DEFAULT,
  ),
        
                child: SvgPicture.asset(SVGImagePaths.instance.backArrow)),
              context.sizedBoxLowHorizontal
            ],
          
          ),   
        body: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            return Center(
              child: CustomBox(
                  city: state.selectCity,
                  county: state.selectCounty,
                  onTapCity: ()  {
                     cubit.navigateCitySelect(context);
                  },
                  onTapCounty: ()  {
                     cubit.navigateCountySelect(context);
                  },
                  onTapSearch: () => cubit.navigateToView(navigationPath: NavigationConstants.MUSEUM_VIEW)
                  ),
            );
          },
        ),
      ),
    );
  }
}
