import 'package:flutter/material.dart';
import 'package:turkey_museum_app/features/explore_museum/view/explore_museum_view.dart';
import 'package:turkey_museum_app/features/filter/view/filter_view.dart';
import 'package:turkey_museum_app/features/home/view/home_view.dart';
import 'package:turkey_museum_app/features/museum/model/museum_model.dart';

import 'package:turkey_museum_app/features/museum/view/museum_detail_view.dart';
import 'package:turkey_museum_app/features/museum/view/museum_view.dart';

import '../../components/cards/not_found_navigation.dart';
import '../../constants/enums/navigation_routes.dart';




class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
       case NavigationConstants.DEFAULT:
        return normalNavigate(const HomeView());
      case NavigationConstants.FILTER_VIEW:
        return normalNavigate( const FilterView());
      case NavigationConstants.MUSEUM_VIEW:
        return normalNavigate( const MuseumView());
      case NavigationConstants.MUSEUM_DETAIL_VIEW:
        return normalNavigate( MuseumDetailView(detailMuseumView: args.arguments! as MuseumModel,));
      case NavigationConstants.EXPLORE_MUSEUM:
        return normalNavigate( const ExploreMuseumView());
      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
