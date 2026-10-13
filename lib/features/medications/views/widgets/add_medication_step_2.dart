import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/icons.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/extentions/context_extentions.dart';
import 'package:mend/features/medications/views/widgets/add_medication_title.dart';
import 'package:mend/shared/widgets/dropdown.dart';
import 'package:mend/shared/widgets/text_field.dart';

class AddMedicationStep2 extends StatelessWidget {
  const AddMedicationStep2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _time = TextEditingController();


    return Column(
      children: [
        AddMedicationTitle(
          icon: AppIcon.svgPill,
          title: 'Medication details',
          subtitle: "Let's start with the basics. You can update these later.",
        ),
        SizedBox(height: AppSize.large.h),
    
        MyDropDown(
          label: 'Frequency',
          hint: 'Select',
          items: const ['Every day', 'Specific days', 'As needed'],
        ),
        SizedBox(height: AppSize.medium.h),

        MyDropDown(
          label: 'Times per day',
          hint: 'Select',
          items: const ['Twice daily', 'Once daily', 'Three times daily'],
        ),
        SizedBox(height: AppSize.medium.h),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reminder time', style: context.text.labelMedium),
            SizedBox(height: AppSize.small.h),
            Row(
              spacing: AppSize.small.w,
              children: [
                Icon(AppIcon.iconDay),
                Expanded(
                  child: MyTextField(
                    hintText: 'Pick a time',
                    controller: _time,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.access_time_rounded),
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 8, minute: 0),
                      );
                      if (picked != null && context.mounted) {
                        _time.text = picked.format(context);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.medium.h),
            Row(
              spacing: AppSize.small.w,
              children: [
                Icon(AppIcon.iconNight),
                Expanded(
                  child: MyTextField(
                    hintText: 'Pick a time',
                    controller: _time,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.access_time_rounded),
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 8, minute: 0),
                      );
                      if (picked != null && context.mounted) {
                        _time.text = picked.format(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
       
      ],
    );
  }
}