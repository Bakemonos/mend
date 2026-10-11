import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/colors.dart';
import 'package:mend/core/constants/enum.dart';
import 'package:mend/core/constants/icons.dart';
import 'package:mend/core/constants/padding_size.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/extentions/context_extentions.dart';
import 'package:mend/features/medications/controllers/med_modification_provider.dart';
import 'package:mend/shared/widgets/svg.dart';

class MedicationDetailsCard extends ConsumerWidget {
  const MedicationDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Card(
      child: Stack(
        children: [
          Padding(
            padding: AppPadding.onScreen,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSize.small.w,
                  children: [
                    Container(
                      width: AppSize.extraLarge.sp,
                      height: AppSize.extraLarge.sp,
                      decoration: BoxDecoration(
                        color: AppColor.primaryFade,
                        borderRadius: BorderRadiusDirectional.circular(AppSize.radiusSmall.r)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(AppSize.paddingXSmall.sp),
                        child: MySvg(
                          assetPath: AppIcon.svgPill,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                    Column(
                      spacing: AppSize.superSmall.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Vitamin D'),
                        Text('500 mg • tablet', style: context.text.bodySmall?.copyWith(
                          color: AppColor.textBlack,
                          fontWeight: FontWeight.w500
                        )),
                        Text('Once daily', style: context.text.labelSmall),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: AppColor.line,
                  thickness: AppSize.borderTiny.w,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: AppSize.small.w,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: context.colors.onSecondary,
                      size: AppSize.iconSmall.sp,
                    ),
                    Text('Next: Today, 6:00 PM', style: context.text.labelSmall),
                    const Spacer(),
                    Text('8 tablets left', style: context.text.labelSmall),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topRight,
            child: PopupMenuButton<MedicationAction>(
              icon: const Icon(Icons.more_horiz),
              onSelected: (action) => ref.read(MedModificationProvider.notifier).setSelectedOption(action),
              itemBuilder: (context) => List.generate(ref.read(MedModificationProvider.notifier).options.length, (index) {
                final option = ref.read(MedModificationProvider.notifier).options[index];
                final isDelete = option.value ==  MedicationAction.delete;
    
                return PopupMenuItem(
                  height: AppSize.large.h,
                  value: option.value,
                  child: Row(
                    spacing: AppSize.small.w,
                    children: [
                      MySvg(
                        assetPath: option.icon,
                        color: isDelete ? AppColor.red : context.colors.onSecondary,
                        size: AppSize.iconRegular.sp,
                      ),
                      Text(option.title, style: context.text.labelSmall?.copyWith(
                        color: isDelete ? AppColor.red : null
                      )),
                    ],
                  ),
                ); 
              })
            )
          ),
        ],
      ),
    );
  }
}


