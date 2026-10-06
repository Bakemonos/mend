import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mend/core/routing/routes_path.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  routes: [
    // GoRoute(
    //   path: Routes.selection,
    //   builder: (context, state) => const RoleSelectionScreen()
    // ),


  ],
);