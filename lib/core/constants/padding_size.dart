import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/sizes.dart';

abstract class AppPadding {
  static EdgeInsets get screen => EdgeInsets.symmetric(horizontal: AppSize.paddingSmall.w, vertical: AppSize.paddingSmall.h);
  static EdgeInsets get onScreen => EdgeInsets.symmetric(horizontal: AppSize.paddingXSmall.w, vertical: AppSize.paddingXSmall.h);
  static EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: AppSize.paddingSmall.w);

}