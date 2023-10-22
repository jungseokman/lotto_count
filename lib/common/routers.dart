import 'package:go_router/go_router.dart';
import 'package:lotto_web/main/main_page.dart';

final routers = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainPage()),
    )
  ],
);
