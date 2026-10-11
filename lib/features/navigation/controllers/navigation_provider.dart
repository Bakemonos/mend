import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mend/core/constants/icons.dart';
import 'package:mend/features/history/views/screens/history_screen.dart';
import 'package:mend/features/home/views/screens/home_screen.dart';
import 'package:mend/features/medications/views/screens/medications_screen.dart';
import 'package:mend/features/profile/views/screens/profile_screen.dart';
import 'package:mend/features/schedule/views/screens/schedule_screen.dart';
import 'package:mend/shared/widgets/svg.dart';

abstract class NavigationConfig {

  static const navigationOptions = <Widget>[
    NavigationDestination(icon: MySvg(assetPath: AppIcon.svgHome), label: 'Home'),
    NavigationDestination(icon: MySvg(assetPath: AppIcon.svgPill), label: 'Meds'),
    NavigationDestination(icon: MySvg(assetPath: AppIcon.svgCalendar), label: 'Schedule'),
    NavigationDestination(icon: MySvg(assetPath: AppIcon.svgHistory), label: 'History'),
    NavigationDestination(icon: MySvg(assetPath: AppIcon.svgUser), label: 'Profile')
  ];

  static const navigationScreens = <Widget>[
    HomeScreen(),
    MedicationScreen(),
    ScheduleScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

}

class NavigationNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setSelected(index) => state = index;

}

final navigationProvider = NotifierProvider.autoDispose<NavigationNotifier, int>(NavigationNotifier.new);