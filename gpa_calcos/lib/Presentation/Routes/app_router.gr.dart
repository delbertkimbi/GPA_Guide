// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:gpa_calcos/Presentation/screens/auth/login.dart' as _i4;
import 'package:gpa_calcos/Presentation/screens/auth/signup.dart' as _i5;
import 'package:gpa_calcos/Presentation/screens/grading_system.dart' as _i1;
import 'package:gpa_calcos/Presentation/screens/home.dart' as _i2;
import 'package:gpa_calcos/Presentation/screens/splash/landing.dart' as _i3;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    GradingSystem.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GradingSystem(),
      );
    },
    HomePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LandingPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LandingPage(),
      );
    },
    LogIn.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LogIn(),
      );
    },
    SignUp.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUp(),
      );
    },
  };
}

/// generated route for
/// [_i1.GradingSystem]
class GradingSystem extends _i6.PageRouteInfo<void> {
  const GradingSystem({List<_i6.PageRouteInfo>? children})
      : super(
          GradingSystem.name,
          initialChildren: children,
        );

  static const String name = 'GradingSystem';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomePage extends _i6.PageRouteInfo<void> {
  const HomePage({List<_i6.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LandingPage]
class LandingPage extends _i6.PageRouteInfo<void> {
  const LandingPage({List<_i6.PageRouteInfo>? children})
      : super(
          LandingPage.name,
          initialChildren: children,
        );

  static const String name = 'LandingPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LogIn]
class LogIn extends _i6.PageRouteInfo<void> {
  const LogIn({List<_i6.PageRouteInfo>? children})
      : super(
          LogIn.name,
          initialChildren: children,
        );

  static const String name = 'LogIn';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUp]
class SignUp extends _i6.PageRouteInfo<void> {
  const SignUp({List<_i6.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
