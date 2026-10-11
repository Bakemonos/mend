import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/padding_size.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/features/medications/views/widgets/medication_details_card.dart';
import 'package:mend/features/medications/views/widgets/time_filter_chips.dart';
import 'package:mend/shared/widgets/search_field.dart';


class MedicationScreen extends ConsumerWidget {
  const MedicationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: AppPadding.screen,
      child: Column(
        spacing: AppSize.mediumSmall.h,
        children: [
          const MySearchField(),
          const TimeFilterChips(totalCount: 3),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: AppSize.small.h),
              itemCount: 5,
              itemBuilder: (context, index) {

                return const MedicationDetailsCard();
              },
            )
          )
        ],
      ),
    );
  }
}

