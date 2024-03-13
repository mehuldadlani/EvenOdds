// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:layer_2/ui/views/bet/bet_view.dart' as _i8;
import 'package:layer_2/ui/views/bottom_nav_bar/bottom_nav_bar_view.dart'
    as _i9;
import 'package:layer_2/ui/views/home/home_view.dart' as _i2;
import 'package:layer_2/ui/views/landing/landing_view.dart' as _i6;
import 'package:layer_2/ui/views/login/login_view.dart' as _i4;
import 'package:layer_2/ui/views/place_bet/place_bet_view.dart' as _i11;
import 'package:layer_2/ui/views/previous_bets/previous_bets_view.dart' as _i10;
import 'package:layer_2/ui/views/register/register_view.dart' as _i5;
import 'package:layer_2/ui/views/startup/startup_view.dart' as _i3;
import 'package:layer_2/ui/views/token/token_view.dart' as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const landingView = '/landing-view';

  static const tokenView = '/token-view';

  static const betView = '/bet-view';

  static const bottomNavBarView = '/bottom-nav-bar-view';

  static const previousBetsView = '/previous-bets-view';

  static const placeBetView = '/place-bet-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    registerView,
    landingView,
    tokenView,
    betView,
    bottomNavBarView,
    previousBetsView,
    placeBetView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i5.RegisterView,
    ),
    _i1.RouteDef(
      Routes.landingView,
      page: _i6.LandingView,
    ),
    _i1.RouteDef(
      Routes.tokenView,
      page: _i7.TokenView,
    ),
    _i1.RouteDef(
      Routes.betView,
      page: _i8.BetView,
    ),
    _i1.RouteDef(
      Routes.bottomNavBarView,
      page: _i9.BottomNavBarView,
    ),
    _i1.RouteDef(
      Routes.previousBetsView,
      page: _i10.PreviousBetsView,
    ),
    _i1.RouteDef(
      Routes.placeBetView,
      page: _i11.PlaceBetView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.RegisterView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.RegisterView(),
        settings: data,
      );
    },
    _i6.LandingView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LandingView(),
        settings: data,
      );
    },
    _i7.TokenView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.TokenView(),
        settings: data,
      );
    },
    _i8.BetView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.BetView(),
        settings: data,
      );
    },
    _i9.BottomNavBarView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.BottomNavBarView(),
        settings: data,
      );
    },
    _i10.PreviousBetsView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.PreviousBetsView(),
        settings: data,
      );
    },
    _i11.PlaceBetView: (data) {
      final args = data.getArgs<PlaceBetViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.PlaceBetView(
            key: args.key, betId: args.betId, betName: args.betName),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PlaceBetViewArguments {
  const PlaceBetViewArguments({
    this.key,
    required this.betId,
    required this.betName,
  });

  final _i12.Key? key;

  final String betId;

  final String betName;

  @override
  String toString() {
    return '{"key": "$key", "betId": "$betId", "betName": "$betName"}';
  }

  @override
  bool operator ==(covariant PlaceBetViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.betId == betId && other.betName == betName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ betId.hashCode ^ betName.hashCode;
  }
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTokenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tokenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.betView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPreviousBetsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.previousBetsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlaceBetView({
    _i12.Key? key,
    required String betId,
    required String betName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.placeBetView,
        arguments:
            PlaceBetViewArguments(key: key, betId: betId, betName: betName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTokenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tokenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.betView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPreviousBetsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.previousBetsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlaceBetView({
    _i12.Key? key,
    required String betId,
    required String betName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.placeBetView,
        arguments:
            PlaceBetViewArguments(key: key, betId: betId, betName: betName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
