import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turkey_museum_app/core/constants/image/image_path_svg.dart';
import 'package:turkey_museum_app/core/constants/text_constants.dart';
import 'package:turkey_museum_app/core/extensions/context_extensions.dart';
import 'package:turkey_museum_app/core/init/di/locator.dart';
import 'package:turkey_museum_app/features/museum/cubit/museum_cubit.dart';
import '../../../core/base/view/base_view.dart';
import '../model/museum_model.dart';

class MuseumDetailView extends StatelessWidget {
  final MuseumModel detailMuseumView;
  const MuseumDetailView({Key? key, required this.detailMuseumView})
      : super(key: key);

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
              TextConstants.museumDetails,
              style: context.textTheme.headline1!.copyWith(color: Colors.black),
            ),
            actions: [
              GestureDetector(
                  onTap: () => cubit.navigateToPop(),
        
                  child: SvgPicture.asset(SVGImagePaths.instance.backArrow)),
              context.sizedBoxLowHorizontal
            ],
          ),
          body: BlocBuilder<MuseumCubit, MuseumState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Padding(
                    padding: context.paddingLowHorizontal,
                    child: ListView(
                      controller: cubit.controllerScrollMuseumDetailView,
                      children: [
                        Text(
                            "${detailMuseumView.ilce}, ${detailMuseumView.sehir}",
                            style: context.textTheme.headline3!
                                .copyWith(fontWeight: FontWeight.bold)),
                        context.sizedBoxMediumVertical,
                        Text(
                          "${detailMuseumView.muzeAd}",
                          style: context.textTheme.headline4!
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text("${detailMuseumView.muzeAciklama}",
                            style: context.textTheme.bodyText2),
                        const Divider(),
                        RichText(
                            text: TextSpan(
                                style: context.textTheme.headline5,
                                children: [
                              TextSpan(
                                  text: TextConstants.muesumHours,
                                  style: context.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: detailMuseumView.calismaSaatleri,
                                  style: context.textTheme.bodyText2)
                            ])),
                        RichText(
                            text: TextSpan(
                                style: context.textTheme.headline5,
                                children: [
                              TextSpan(
                                  text: TextConstants.entryDetails,
                                  style: context.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: detailMuseumView.girisDetay,
                                  style: context.textTheme.bodyText2)
                            ])),
                        RichText(
                            text: TextSpan(
                                style: context.textTheme.headline5,
                                children: [
                              TextSpan(
                                  text: TextConstants.addressMuseum,
                                  style: context.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: detailMuseumView.muzeAdres,
                                  style: context.textTheme.bodyText2)
                            ])),
                        RichText(
                            text: TextSpan(
                                style: context.textTheme.headline5,
                                children: [
                              TextSpan(
                                  text: TextConstants.mailMuseum,
                                  style: context.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: detailMuseumView.muzeMail,
                                  style: context.textTheme.bodyText2)
                            ])),
                        RichText(
                            text: TextSpan(
                                style: context.textTheme.headline5,
                                children: [
                              TextSpan(
                                  text: TextConstants.phoneMuseum,
                                  style: context.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: detailMuseumView.muzeTel,
                                  style: context.textTheme.bodyText2)
                            ])),
                        RichText(
                            text: TextSpan(
                                style: context.textTheme.headline5,
                                children: [
                              TextSpan(
                                  text: TextConstants.webMuseum,
                                  style: context.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: detailMuseumView.muzeWebSite,
                                  style: context.textTheme.bodyText2)
                            ])),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
