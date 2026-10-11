import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/colors.dart';
import 'package:mend/core/constants/sizes.dart';

class MyFilterChip extends StatelessWidget {
  const MyFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.count,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? AppColor.primaryDark : AppColor.primary;
    final text = Theme.of(context).textTheme;

    final background = selected
      ? accent.withValues(alpha: 0.12)
      : (isDark ? AppColor.surfaceDark : Colors.white);
    final border = selected
      ? accent
      : (isDark ? AppColor.lineDark : AppColor.lineLight);

    return Material(
      color: background,
      shape: StadiumBorder(
        side: BorderSide(color: border, width: 1.w),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.paddingSSmall.w, 
            vertical: AppSize.padding2XSmall.h
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: text.bodyMedium?.copyWith(
                  fontSize: AppSize.fontSmall.sp,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              if (count != null) ...[
                SizedBox(width: AppSize.small.w),
                Container(
                  constraints: BoxConstraints(minWidth: 20.w, minHeight: 20.w),
                  padding: EdgeInsets.symmetric(horizontal: AppSize.image3XSmall.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: AppSize.fontExtraSmall.sp,
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColor.navDarkTop : Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}