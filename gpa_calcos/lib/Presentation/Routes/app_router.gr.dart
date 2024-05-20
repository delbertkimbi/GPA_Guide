// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:gpa_calcos/Presentation/screens/auth/login.dart' as _i7;
import 'package:gpa_calcos/Presentation/screens/auth/signup.dart' as _i9;
import 'package:gpa_calcos/Presentation/screens/get_cgpa_info.dart' as _i1;
import 'package:gpa_calcos/Presentation/screens/get_gpa_info.dart' as _i2;
import 'package:gpa_calcos/Presentation/screens/gpa_results.dart' as _i8;
import 'package:gpa_calcos/Presentation/screens/grading_system.dart' as _i3;
import 'package:gpa_calcos/Presentation/screens/home.dart' as _i4;
import 'package:gpa_calcos/Presentation/screens/learning_resources.dart' as _i6;
import 'package:gpa_calcos/Presentation/screens/splash/landing.dart' as _i5;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    CgpaInfo.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CgpaInfo(),
      );
    },
    GetSubjectInfo.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GetSubjectInfo(),
      );
    },
    GradingSystem.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GradingSystem(),
      );
    },
    HomePage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    LandingPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LandingPage(),
      );
    },
    Learningpage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.Learningpage(),
      );
    },
    LogIn.name: (routeData) {
      final args = routeData.argsAs<LogInArgs>(orElse: () => const LogInArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LogIn(key: args.key),
      );
    },
    ResultPage.name: (routeData) {
      final args = routeData.argsAs<ResultPageArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ResultPage(
          key: args.key,
          ccv: args.ccv,
          cwgp: args.cwgp,
          gpa: args.gpa,
        ),
      );
    },
    SignUp.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignUp(),
      );
    },
  };
}

/// generated route for
/// [_i1.CgpaInfo]
class CgpaInfo extends _i10.PageRouteInfo<void> {
  const CgpaInfo({List<_i10.PageRouteInfo>? children})
      : super(
          CgpaInfo.name,
          initialChildren: children,
        );

  static const String name = 'CgpaInfo';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GetSubjectInfo]
class GetSubjectInfo extends _i10.PageRouteInfo<void> {
  const GetSubjectInfo({List<_i10.PageRouteInfo>? children})
      : super(
          GetSubjectInfo.name,
          initialChildren: children,
        );

  static const String name = 'GetSubjectInfo';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GradingSystem]
class GradingSystem extends _i10.PageRouteInfo<void> {
  const GradingSystem({List<_i10.PageRouteInfo>? children})
      : super(
          GradingSystem.name,
          initialChildren: children,
        );

  static const String name = 'GradingSystem';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomePage extends _i10.PageRouteInfo<void> {
  const HomePage({List<_i10.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LandingPage]
class LandingPage extends _i10.PageRouteInfo<void> {
  const LandingPage({List<_i10.PageRouteInfo>? children})
      : super(
          LandingPage.name,
          initialChildren: children,
        );

  static const String name = 'LandingPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.Learningpage]
class Learningpage extends _i10.PageRouteInfo<void> {
  const Learningpage({List<_i10.PageRouteInfo>? children})
      : super(
          Learningpage.name,
          initialChildren: children,
        );

  static const String name = 'Learningpage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LogIn]
class LogIn extends _i10.PageRouteInfo<LogInArgs> {
  LogIn({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LogIn.name,
          args: LogInArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LogIn';

  static const _i10.PageInfo<LogInArgs> page = _i10.PageInfo<LogInArgs>(name);
}

class LogInArgs {
  const LogInArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LogInArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ResultPage]
class ResultPage extends _i10.PageRouteInfo<ResultPageArgs> {
  ResultPage({
    _i11.Key? key,
    required double ccv,
    required double cwgp,
    required double gpa,
    List<_i10.PageRouteInfo>? children,
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

  static const _i10.PageInfo<ResultPageArgs> page =
      _i10.PageInfo<ResultPageArgs>(name);
}

class ResultPageArgs {
  const ResultPageArgs({
    this.key,
    required this.ccv,
    required this.cwgp,
    required this.gpa,
  });

  final _i11.Key? key;

  final double ccv;

  final double cwgp;

  final double gpa;

  @override
  String toString() {
    return 'ResultPageArgs{key: $key, ccv: $ccv, cwgp: $cwgp, gpa: $gpa}';
  }
}

/// generated route for
/// [_i9.SignUp]
class SignUp extends _i10.PageRouteInfo<void> {
  const SignUp({List<_i10.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
