import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/icons.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/shared/widgets/svg.dart';

class MySearchField extends StatelessWidget {
  const MySearchField({
    super.key,
    this.controller,
    this.hintText = 'Search medications',
    this.onChanged,
    this.onClear,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: EdgeInsets.all(AppSize.paddingSSmall.sp),
          child: MySvg(assetPath: AppIcon.svgSearch, size: AppSize.iconSmall.sp),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: AppSize.textFieldHeight.h, minHeight: AppSize.textFieldHeight.h),
        suffixIcon: controller == null ? null : ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller!,
          builder: (_, value, __) => value.text.isEmpty 
          ? const SizedBox.shrink() 
          : IconButton(
            icon: const Icon(Icons.close_rounded, size: 20),
            onPressed: () {
              controller!.clear();
              onClear?.call();
            },
          ),
        ),
      ),
    );
  }
}