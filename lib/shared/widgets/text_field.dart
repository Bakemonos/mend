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
    this.onTap,
    this.readOnly = false,
    this.prefixIcon,
    this.label,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.suffixIcon,
  });

  final bool readOnly;
  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onTap;
  final String? prefixIcon;
  final String? label;
  final int minLines;
  final int? maxLines; 
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;

  bool get _isMultiline => (maxLines ?? 2) > 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSize.small.h,
      children: [
        if (label != null) Text(label!, style: context.text.labelMedium),
        TextField(
          controller: controller,
          onChanged: onChanged,
          minLines: minLines,
          maxLines: maxLines,
          readOnly: readOnly,
          showCursor: !readOnly,
          onTap: onTap,
          keyboardType: keyboardType ??
            (_isMultiline ? TextInputType.multiline : TextInputType.text),
          textInputAction: textInputAction ??
            (_isMultiline ? TextInputAction.newline : TextInputAction.next),
          textCapitalization: textCapitalization,
          textAlignVertical: _isMultiline ? TextAlignVertical.top : null,
          style: Theme.of(context).textTheme.titleSmall,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            alignLabelWithHint: true,
            constraints: BoxConstraints(minHeight: AppSize.textFieldHeight.h),
            prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(AppSize.paddingSSmall.sp),
                  child: MySvg(assetPath: prefixIcon!, size: AppSize.iconSmall.sp),
                )
              : null,
            prefixIconConstraints: BoxConstraints(
              minWidth: AppSize.textFieldHeight.h,
              minHeight: AppSize.textFieldHeight.h,
            ),
          ),
        ),
      ],
    );
  }
}