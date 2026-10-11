import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/colors.dart';
import 'package:mend/core/constants/enum.dart';
import 'package:mend/core/constants/icons.dart';
import 'package:mend/core/constants/padding_size.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/extentions/context_extentions.dart';
import 'package:mend/shared/controllers/medication_type_provider.dart';
import 'package:mend/shared/widgets/app_bar.dart';
import 'package:mend/shared/widgets/button.dart';
import 'package:mend/shared/widgets/dropdown.dart';
import 'package:mend/shared/widgets/filter_chip.dart';
import 'package:mend/shared/widgets/step_progress.dart';
import 'package:mend/shared/widgets/svg.dart';
import 'package:mend/shared/widgets/text_field.dart';

class AddMedicationsScreen extends ConsumerWidget {
  const AddMedicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: MyAppBar(
        title: 'Add Medications', 
        subTitle: 'Step 1 of 3',
        bottom: StepProgressBar(totalSteps: 3),
      ),
      body: Padding(
        padding: AppPadding.screen,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60.sp,
                  height: 60.sp,
                  decoration: BoxDecoration(
                    color: AppColor.primaryFade,
                    borderRadius: BorderRadiusDirectional.circular(AppSize.radiusSmall.r)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.paddingSmall.sp),
                    child: MySvg(
                      assetPath: AppIcon.svgPill,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.mediumSmall.h),
                Text('Medication details', style: context.text.bodyLarge),
                SizedBox(height: AppSize.extraSmall.h),
                Text(
                  "Let's start with the basics. You can update these later.",
                  style: context.text.bodySmall,
                ),
              ],
            ),
            SizedBox(height: AppSize.large.h),


            MyTextField(
              label: 'Medication name',
              hintText: 'e.g. Paracetamol',
            ),
            SizedBox(height: AppSize.medium.h),
            Row(
              spacing: AppSize.mediumSmall.w,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: MyTextField(
                    label: 'Dosage',
                    hintText: 'e.g. 500',
                  ),
                ),
                Expanded(
                  child: MyDropDown(
                    hint: 'Unit',
                    items: const ['mg', 'mcg', 'g', 'ml', 'IU'],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.medium.h),

            Consumer(
              builder: (context, ref, child) {
                final medicationTypeState = ref.watch(MedicationTypeProvider);
                return Column(
                  spacing: AppSize.small.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Medication Type', style: context.text.labelMedium),
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var type in medicationTypeState) ... [
                              Container(
                                width: 60.sp,
                                height: 60.sp,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryFade,
                                  borderRadius: BorderRadiusDirectional.circular(AppSize.radiusSmall.r)
                                ),
                                child: Column(
                                  spacing: AppSize.superSmall.h,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MySvg(assetPath: AppIcon.svgPill, color: AppColor.primary, size: AppSize.iconSmall.sp),
                                    Text(type, style: context.text.bodySmall?.copyWith(color: context.colors.onPrimary))
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                            ]
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: AppSize.navigationBarHeight.h,
          padding: AppPadding.horizontal,
          child: Row(
            spacing: AppSize.mediumSmall.w,
            children: [
              Expanded(
                child: MyButton(
                  buttonType: ButtonType.outlined,
                  text: 'Cancel',
                  onPressed: () {
                    
                  },
                ),
              ),
              Expanded(
                child: MyButton(
                  text: 'Continue',
                  onPressed: () {
                    
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

