import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/enum.dart';
import 'package:mend/features/medications/controllers/medication_filter_provider.dart';
import 'package:mend/shared/widgets/filter_chip.dart';

class TimeFilterChips extends ConsumerWidget {
  const TimeFilterChips({super.key, required this.totalCount});

  final int totalCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(medicationFilterProvider);

    String labelOf(TimeFilter option) =>
        option.name[0].toUpperCase() + option.name.substring(1);

    return  SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var option in TimeFilter.values) ... [
              MyFilterChip(
                label: labelOf(option),
                selected: selected == option,
                count: option == TimeFilter.all ? totalCount : null,
                onTap: () => ref.read(medicationFilterProvider.notifier).set(option),
              ),
              SizedBox(width: 8.w),
            ]
          ],
        ),
      ),
    );
  }
}