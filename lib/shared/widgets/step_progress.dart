
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/colors.dart';
import 'package:mend/core/constants/sizes.dart';

class StepProgressBar extends StatelessWidget {
  const StepProgressBar({
    super.key,
    required this.totalSteps,
    this.currentStep = 0,
  });

  final int totalSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final active = isDark ? AppColor.primaryDark : AppColor.primary;
    final inactive = isDark ? AppColor.lineDark : AppColor.line;

    return Row(
      children: [
        for (var i = 0; i < totalSteps; i++) ...[
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: AppSize.extraSmall.h,
              decoration: BoxDecoration(
                color: i <= currentStep ? active : inactive,
                borderRadius: BorderRadius.circular(AppSize.radiusSuperSmall.r),
              ),
            ),
          ),
          if (i < totalSteps - 1) SizedBox(width: AppSize.small.h.w),
        ],
      ],
    );
  }
}