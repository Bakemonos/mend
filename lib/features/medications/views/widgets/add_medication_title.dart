import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/colors.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/extentions/context_extentions.dart';
import 'package:mend/shared/widgets/svg.dart';

class AddMedicationTitle extends StatelessWidget {
  const AddMedicationTitle({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.subtitle,
  });

  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              assetPath: icon,
              color: AppColor.primary,
            ),
          ),
        ),
        SizedBox(height: AppSize.mediumSmall.h),
        Text(title, style: context.text.bodyLarge),
        SizedBox(height: AppSize.extraSmall.h),
        Text(subtitle, style: context.text.bodySmall),
      ],
    );
  }
}