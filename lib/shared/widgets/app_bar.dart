import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/extentions/context_extentions.dart';

class MyAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.actions,
    this.bottom,
    this.bottomHeight = 24,
  });

  final String title;
  final String? subTitle;
  final List<Widget>? actions;
  final Widget? bottom;
  final double bottomHeight;

  static const double _height = 72;

  @override
  Size get preferredSize =>
      Size.fromHeight(_height + (bottom != null ? bottomHeight.h : 0));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canPop = context.canPop();

    return AppBar(
      toolbarHeight: _height,
      centerTitle: false,
      titleSpacing: canPop ? AppSize.small.w : AppSize.medium.w,
      actionsPadding: EdgeInsets.symmetric(horizontal: AppSize.medium.w),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSize.superSmall.h,
        children: [
          Text(title, style: context.text.headlineMedium),
          if (subTitle != null) Text(subTitle!, style: context.text.bodySmall),
        ],
      ),
      actions: actions,
      bottom: bottom == null ? null : PreferredSize(
        preferredSize: Size.fromHeight(bottomHeight.h),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSize.medium.w,
            0,
            AppSize.medium.w,
            AppSize.small.h,
          ),
          child: bottom!,
        ),
      ),
    );
  }
}