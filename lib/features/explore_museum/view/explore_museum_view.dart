import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:turkey_museum_app/core/constants/app/app_constant.dart';
import 'package:turkey_museum_app/core/constants/enums/navigation_routes.dart';
import 'package:turkey_museum_app/core/constants/image/image_path_svg.dart';
import 'package:turkey_museum_app/core/constants/text_constants.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';
import 'package:turkey_museum_app/features/museum/components/cards/card_museum.dart';
import '../../../core/base/view/base_view.dart';
import '../cubit/explore_museum_cubit.dart';

class ExploreMuseumView extends StatelessWidget {
  const ExploreMuseumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreMuseumCubit>(
      cubit: ExploreMuseumCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (ExploreMuseumCubit cubit) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              TextConstants.exploreMuseum,
              style: context.textTheme.headline1!.copyWith(color: Colors.black),
            ),
            actions: [
              GestureDetector(
                onTap: () => cubit.navigatPop(),
                child: SvgPicture.asset(SVGImagePaths.instance.backArrow)),
              context.sizedBoxLowHorizontal
            ],
          ),
          body: BlocBuilder<ExploreMuseumCubit, ExploreMuseumState>(
            builder: (context, state) {
              return state.museumFetchLoading
                  ? Lottie.asset(AppConstants.MUSEUM_LOADING_ASSET)
                  : state.museumAnkara!.isEmpty ? buildNotFoundMuseum(context): ListView(
                    controller: cubit.controllerScrollExploreMuseumView,
                    children: [
                    Padding(
                      padding:context.paddingLowHorizontal,
                      child: buildLocationIconAndTitle(context, 'ANKARA'),
                    ),
                    context.sizedBoxLowVertical,
                      SizedBox(
                        height: 190,
                        child: buildMuseumListAnkara(state, cubit)),
                    context.sizedBoxLowVertical,

                    const Divider(),
                     Padding(
                       padding: context.paddingLowHorizontal,
                       child: buildLocationIconAndTitle(context, 'IZMIR'),
                     ),
                    context.sizedBoxLowVertical,

                      SizedBox(
                        height: 190,
                        child: buildMuseumListIzmir(state, cubit)),
                           context.sizedBoxLowVertical,

                    const Divider(),

                                        Padding(
                                          padding:context.paddingLowHorizontal,
                                          child: buildLocationIconAndTitle(context, 'ISTANBUL'),
                                        ),
                    context.sizedBoxLowVertical,
                      SizedBox(
                        height: 190,
                        child: buildMuseumListIstanbul(state, cubit)),
                    context.sizedBoxLowVertical,

                    const Divider(),

                                        Padding(
                                          padding: context.paddingLowHorizontal,
                                          child: buildLocationIconAndTitle(context, 'ANTALYA'),
                                        ),
                    context.sizedBoxLowVertical,
                      SizedBox(
                        height: 190,
                        child: buildMuseumListAntalya(state, cubit)),
                    context.sizedBoxLowVertical,

                    const Divider(),
                                        Padding(
                                          padding: context.paddingLowHorizontal,
                                          child: buildLocationIconAndTitle(context, 'BURSA'),
                                        ),
                    context.sizedBoxLowVertical,
                      SizedBox(
                        height: 190,
                        child: buildMuseumListBursa(state, cubit)),
                    context.sizedBoxLowVertical,

                    const Divider(),
                    ],
                  );
            },
          ),
        ),
      ),
    );
  }

  Row buildLocationIconAndTitle(
      BuildContext context,String? title) {
    return Row(
      children: [
        SvgPicture.asset(SVGImagePaths.instance.locationIcon),
        context.sizedBoxLowHorizontal,
        Text(
          "$title",
          style: context.textTheme.headline3!.copyWith(
              color: context.appColors.tundora,
              fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
  ListView buildMuseumListAnkara(ExploreMuseumState state, ExploreMuseumCubit cubit) {
    return ListView.separated(
      controller: cubit.controllerScrollAnkara,
      separatorBuilder: (BuildContext context, int index) => context.sizedBoxMediumHorizontal,
                    itemCount: state.museumAnkara!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return  buildMuseumCard(state, index, cubit, museumTitle: state.museumAnkara![index].muzeAd, museumCity: state.museumAnkara![index].sehir, museumCounty: state.museumAnkara![index].ilce, data: state.museumAnkara![index]);
                    }));
  }
    ListView buildMuseumListIzmir(ExploreMuseumState state, ExploreMuseumCubit cubit) {
    return ListView.separated(
      controller: cubit.controllerScrollIzmir,
      separatorBuilder: (BuildContext context, int index) => context.sizedBoxMediumHorizontal,
                    itemCount: state.museumIzmir!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return  buildMuseumCard(state, index, cubit, museumTitle: state.museumIzmir![index].muzeAd, museumCity: state.museumIzmir![index].sehir, museumCounty: state.museumIzmir![index].ilce, data: state.museumIzmir![index]);
                    }));
  }

      ListView buildMuseumListAntalya(ExploreMuseumState state, ExploreMuseumCubit cubit) {
    return ListView.separated(
      controller: cubit.controllerScrollAntalya,
      separatorBuilder: (BuildContext context, int index) => context.sizedBoxMediumHorizontal,
                    itemCount: state.museumAntalya!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return  buildMuseumCard(state, index, cubit, museumTitle: state.museumAntalya![index].muzeAd, museumCity: state.museumAntalya![index].sehir, museumCounty: state.museumAntalya![index].ilce, data: state.museumAntalya![index]);
                    }));
  }
      ListView buildMuseumListIstanbul(ExploreMuseumState state, ExploreMuseumCubit cubit) {
    return ListView.separated(
      controller: cubit.controllerScrollIstanbul,
      separatorBuilder: (BuildContext context, int index) => context.sizedBoxMediumHorizontal,
                    itemCount: state.museumIstanbul!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return  buildMuseumCard(state, index, cubit, museumTitle: state.museumIstanbul![index].muzeAd, museumCity: state.museumIstanbul![index].sehir, museumCounty: state.museumIstanbul![index].ilce, data: state.museumIstanbul![index]);
                    }));
  }
      ListView buildMuseumListBursa(ExploreMuseumState state, ExploreMuseumCubit cubit) {
    return ListView.separated(
      controller: cubit.controllerScrollBursa,
      separatorBuilder: (BuildContext context, int index) => context.sizedBoxMediumHorizontal,
                    itemCount: state.museumBursa!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return  buildMuseumCard(state, index, cubit, museumTitle: state.museumBursa![index].muzeAd, museumCity: state.museumBursa![index].sehir, museumCounty: state.museumBursa![index].ilce, data: state.museumBursa![index]);
                    }));
  }

  Column buildNotFoundMuseum(BuildContext context) {
    return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: SvgPicture.asset(SVGImagePaths.instance.notFound, height: 200.h,),),
                      context.sizedBoxMediumVertical,
                    Text(TextConstants.notFoundMuseum, style: context.textTheme.headline4!.copyWith(color: Colors.black, fontWeight: FontWeight.w400),)
                  ],
                );
  }

  CardMuseum buildMuseumCard(ExploreMuseumState state, int index, ExploreMuseumCubit cubit, {
    String? museumTitle,
    String? museumCity,
    String? museumCounty,
    Object? data
  }) {
    return CardMuseum(
      museumTitle: museumTitle,
      museumCity: museumCity,
      museumCounty: museumCounty,
      onTapDetails: () => cubit.navigateToView(
          navigationPath: NavigationConstants.MUSEUM_DETAIL_VIEW,
          data: data),
    );
  }

}
