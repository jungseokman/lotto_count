import 'package:go_router/go_router.dart';
import 'package:lotto_web/pages/lotto/lotto_page.dart';
import 'package:lotto_web/pages/main/main_page.dart';
import 'package:lotto_web/pages/progress/progress_page.dart';
import 'package:lotto_web/pages/result/result_page.dart';

final routers = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainPage()),
    ),
    GoRoute(
      path: '/lotto',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LottoPage()),
    ),
    GoRoute(
      path: '/progress',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ProgressPage()),
    ),
    GoRoute(
        path: '/result/:recent',
        pageBuilder: (context, state) {
          return NoTransitionPage(
              child: ResultPage(
            recent: state.pathParameters['recent'].toString(),
          ));
        }),
  ],
);
