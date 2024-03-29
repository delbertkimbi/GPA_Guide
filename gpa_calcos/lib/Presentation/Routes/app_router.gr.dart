// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:gpa_calcos/Presentation/screens/auth/login.dart' as _i5;
import 'package:gpa_calcos/Presentation/screens/auth/signup.dart' as _i7;
import 'package:gpa_calcos/Presentation/screens/get_gpa_info.dart' as _i1;
import 'package:gpa_calcos/Presentation/screens/gpa_results.dart' as _i6;
import 'package:gpa_calcos/Presentation/screens/grading_system.dart' as _i2;
import 'package:gpa_calcos/Presentation/screens/home.dart' as _i3;
import 'package:gpa_calcos/Presentation/screens/splash/landing.dart' as _i4;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    GetSubjectInfo.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GetSubjectInfo(),
      );
    },
    GradingSystem.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GradingSystem(),
      );
    },
    HomePage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LandingPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LandingPage(),
      );
    },
    LogIn.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LogIn(),
      );
    },
    ResultPage.name: (routeData) {
      final args = routeData.argsAs<ResultPageArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ResultPage(
          key: args.key,
          ccv: args.ccv,
          cwgp: args.cwgp,
          gpa: args.gpa,
        ),
      );
    },
    SignUp.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignUp(),
      );
    },
  };
}

/// generated route for
/// [_i1.GetSubjectInfo]
class GetSubjectInfo extends _i8.PageRouteInfo<void> {
  const GetSubjectInfo({List<_i8.PageRouteInfo>? children})
      : super(
          GetSubjectInfo.name,
          initialChildren: children,
        );

  static const String name = 'GetSubjectInfo';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GradingSystem]
class GradingSystem extends _i8.PageRouteInfo<void> {
  const GradingSystem({List<_i8.PageRouteInfo>? children})
      : super(
          GradingSystem.name,
          initialChildren: children,
        );

  static const String name = 'GradingSystem';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i8.PageRouteInfo<void> {
  const HomePage({List<_i8.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LandingPage]
class LandingPage extends _i8.PageRouteInfo<void> {
  const LandingPage({List<_i8.PageRouteInfo>? children})
      : super(
          LandingPage.name,
          initialChildren: children,
        );

  static const String name = 'LandingPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LogIn]
class LogIn extends _i8.PageRouteInfo<void> {
  const LogIn({List<_i8.PageRouteInfo>? children})
      : super(
          LogIn.name,
          initialChildren: children,
        );

  static const String name = 'LogIn';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ResultPage]
class ResultPage extends _i8.PageRouteInfo<ResultPageArgs> {
  ResultPage({
    _i9.Key? key,
    required double ccv,
    required double cwgp,
    required double gpa,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ResultPage.name,
          args: ResultPageArgs(
            key: key,
            ccv: ccv,
            cwgp: cwgp,
            gpa: gpa,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultPage';

  static const _i8.PageInfo<ResultPageArgs> page =
      _i8.PageInfo<ResultPageArgs>(name);
}

class ResultPageArgs {
  const ResultPageArgs({
    this.key,
    required this.ccv,
    required this.cwgp,
    required this.gpa,
  });

  final _i9.Key? key;

  final double ccv;

  final double cwgp;

  final double gpa;

  @override
  String toString() {
    return 'ResultPageArgs{key: $key, ccv: $ccv, cwgp: $cwgp, gpa: $gpa}';
  }
}

/// generated route for
/// [_i7.SignUp]
class SignUp extends _i8.PageRouteInfo<void> {
  const SignUp({List<_i8.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
