import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/extentions/context_extentions.dart';
import 'package:mend/shared/widgets/svg.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.controller,
    this.hintText, 
    this.prefixIcon,
    this.label,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? prefixIcon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSize.small.h,
      children: [
        if(label!=null) Text(label!, style: context.text.labelMedium),
        TextField(
          controller: controller,
          textInputAction: TextInputAction.search,
          style: Theme.of(context).textTheme.titleSmall,
          decoration: InputDecoration(
            hintText: hintText,
            constraints: BoxConstraints(
              minHeight: AppSize.textFieldHeight.h,
              maxHeight: AppSize.textFieldHeight.h,
            ),
            prefixIcon: prefixIcon!=null ? Padding(
              padding: EdgeInsets.all(AppSize.paddingSSmall.sp),

              child: MySvg(assetPath: prefixIcon!, size: AppSize.iconSmall.sp),
            ) : null,
            prefixIconConstraints: BoxConstraints(minWidth: AppSize.textFieldHeight.h, minHeight: AppSize.textFieldHeight.h),
          ),
        ),
      ],
    );
  }
}