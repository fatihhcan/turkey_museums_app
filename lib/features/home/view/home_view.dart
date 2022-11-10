import 'package:flutter/material.dart';
import 'package:turkey_museum_app/core/constants/enums/navigation_routes.dart';
import 'package:turkey_museum_app/core/constants/text_constants.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';
import 'package:turkey_museum_app/features/home/components/button/custom_button.dart';
import 'package:turkey_museum_app/features/home/components/cards_home/cards_home_bottom.dart';
import 'package:turkey_museum_app/features/home/cubit/home_cubit.dart';
import '../../../core/base/view/base_view.dart';
import '../components/cards_home/cards_home_top.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeCubit>(
      cubit: HomeCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (HomeCubit cubit) => SafeArea(
        child: Scaffold(
      backgroundColor: context.appColors.alto,
            body: Column(
          children: [
            buildMuseumExploreCard(cubit, context),
            context.sizedBoxMediumVertical,
            buildMuseumMuseumSearch(context, cubit),
          ],
        )),
      ),
    );
  }

  Expanded buildMuseumMuseumSearch(BuildContext context, HomeCubit cubit) {
    return Expanded(
            child: CardsHomeBottom(
              childBottom: Column(
                children: [
                  context.sizedBoxLowVertical,
                  CustomButton(
                      onTap: () => cubit.navigateToView(
                          navigationPath: NavigationConstants.FILTER_VIEW),
                      title: TextConstants.searchMuseum),
                ],
              ),
            ),
          );
  }

  Expanded buildMuseumExploreCard(HomeCubit cubit, BuildContext context) {
    return Expanded(
            child: CardsHomeTop(
              childTop: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      onTap: () => cubit.navigateToView(
                          navigationPath: NavigationConstants.EXPLORE_MUSEUM),
                      title: TextConstants.exploreMuseum),
                  context.sizedBoxLowVertical,
                ],
              ),
            ),
          );
  }
}
