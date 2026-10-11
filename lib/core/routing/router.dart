import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mend/core/routing/routes_path.dart';
import 'package:mend/features/medications/views/screens/add_medications_screen.dart';
import 'package:mend/features/navigation/views/screens/bottom_navigation.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.main_screen,
  routes: [
    GoRoute(
      path: Routes.main_screen,
      builder: (context, state) => const NavigationScreen()
    ),

    GoRoute(
      path: Routes.addMedication,
      builder: (context, state) => const AddMedicationsScreen()
    ),

    

  ],
);