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
import 'package:turkey_museum_app/core/init/di/locator.dart';
import 'package:turkey_museum_app/features/museum/components/cards/card_museum.dart';
import 'package:turkey_museum_app/features/museum/cubit/museum_cubit.dart';
import '../../../core/base/view/base_view.dart';

class MuseumView extends StatelessWidget {
  const MuseumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MuseumCubit>(
      cubit: locator<MuseumCubit>(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (MuseumCubit cubit) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              TextConstants.museumResult,
              style: context.textTheme.headline1!.copyWith(color: Colors.black),
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    cubit.navigateToView(
                      navigationPath: NavigationConstants.FILTER_VIEW,
                    );
                  },
                  child: SvgPicture.asset(SVGImagePaths.instance.backArrow)),
              context.sizedBoxLowHorizontal
            ],
          ),
          body: BlocBuilder<MuseumCubit, MuseumState>(
            builder: (context, state) {
              return state.museumFetchLoading
                  ? Lottie.asset(AppConstants.MUSEUM_LOADING_ASSET)
                  : state.museum!.isEmpty
                      ? buildNotFoundMuseum(context)
                      : buildMuseumList(state, cubit);
            },
          ),
        ),
      ),
    );
  }

  ListView buildMuseumList(MuseumState state, MuseumCubit cubit) {
    return ListView.builder(
        controller: cubit.controllerScrollMuseumView,
        itemCount: state.museum!.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              context.sizedBoxMediumVertical,
              Padding(
                padding: EdgeInsets.only(
                  left: context.lowValue * 4,
                ),
                child: buildLocationIconAndTitle(context, state, index),
              ),
              context.sizedBoxLowVertical,
              buildMuseumCard(state, index, cubit),
              context.sizedBoxMediumVertical,
              const Divider(),
            ],
          );
        }));
  }

  Column buildNotFoundMuseum(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            SVGImagePaths.instance.notFound,
            height: 200.h,
          ),
        ),
        context.sizedBoxMediumVertical,
        Text(
          TextConstants.notFoundMuseum,
          style: context.textTheme.headline4!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  CardMuseum buildMuseumCard(MuseumState state, int index, MuseumCubit cubit) {
    return CardMuseum(
      museumTitle: state.museum![index].muzeAd,
      museumCity: state.museum![index].sehir,
      museumCounty: state.museum![index].ilce,
      onTapDetails: () => cubit.navigateToView(
          navigationPath: NavigationConstants.MUSEUM_DETAIL_VIEW,
          data: state.museum![index]),
    );
  }

  Row buildLocationIconAndTitle(
      BuildContext context, MuseumState state, int index) {
    return Row(
      children: [
        SvgPicture.asset(SVGImagePaths.instance.locationIcon),
        context.sizedBoxLowHorizontal,
        Text(
          "${state.museum![index].ilce}, ${state.museum![index].sehir}",
          style: context.textTheme.bodyText2!.copyWith(
              color: context.appColors.tundora,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp),
        )
      ],
    );
  }
}
