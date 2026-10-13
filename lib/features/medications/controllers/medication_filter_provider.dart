import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mend/core/constants/enum.dart';

class MedicationFilterNotifier extends Notifier<TimeFilter> {
  @override
  TimeFilter build() => TimeFilter.all;

  void set(TimeFilter value) => state = value;

}

final medicationFilterProvider = NotifierProvider<MedicationFilterNotifier, TimeFilter>(MedicationFilterNotifier.new);