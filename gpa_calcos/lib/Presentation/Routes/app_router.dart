import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen, Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingPage.page),
        AutoRoute(page: HomePage.page),
        AutoRoute(page: LogIn.page),
        AutoRoute(page: SignUp.page),
        AutoRoute(page: SignUp.page),
        AutoRoute(page: PlannerLandingPage.page),
        AutoRoute(page: GradingSystem.page),
        AutoRoute(page: ResultPage.page),
        AutoRoute(page: GetSubjectInfo.page),
        AutoRoute(page: CgpaInfo.page),
        AutoRoute(page: GpaCalculationsLanding.page),
        AutoRoute(page: GpaGoals.page),
        AutoRoute(page: NotifactionsPage.page),
        AutoRoute(page: IconLandingPage.page, initial: true),
      ];
}
