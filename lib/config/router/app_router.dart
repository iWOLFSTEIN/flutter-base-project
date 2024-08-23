import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base_project/config/router/route_item.dart';
import 'package:flutter_base_project/features/home/presentation/pages/explore.dart';
import 'package:flutter_base_project/features/home/presentation/pages/main_view.dart';
import 'package:flutter_base_project/features/home/presentation/pages/home.dart';
import 'package:flutter_base_project/features/home/presentation/pages/settings.dart';

class AppRouter {
  static final List<int> navigationStack = [];

  static const RouteItem home = RouteItem(id: 0, name: 'home', path: '/home');
  static const RouteItem explore =
      RouteItem(id: 1, name: 'explore', path: '/explore');
  static const RouteItem settings =
      RouteItem(id: 2, name: 'settings', path: '/settings');

  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    initialLocation: home.path,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainView(child: child);
        },
        routes: [
          GoRoute(
            path: home.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: Home()),
          ),
          GoRoute(
              path: explore.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Explore())),
          GoRoute(
              path: settings.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Settings())),
        ],
      ),
    ],
  );
}
