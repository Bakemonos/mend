import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/extentions/context_extentions.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown({
    super.key, 
    this.label,
    required this.hint,
    required this.items,
  });

  final String? label;
  final String hint;
  final List<String> items;


  @override
  Widget build(BuildContext context) {
    final valueListenable = ValueNotifier<String?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSize.small.h,
      children: [
        if (label != null) Text(label!, style: context.text.labelMedium),

        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Text(
              hint,
              style: context.text.titleSmall,
            ),
            buttonStyleData: ButtonStyleData(
              height: AppSize.DropDownHeight.h,
              padding: EdgeInsets.symmetric(horizontal: AppSize.padding2XSmall.w),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppSize.radiusMedium.r),
                border: Border.all(
                  width: 1.w,
                  color: context.colors.outline,
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(AppSize.radiusMedium.r)
              )
            ),
            // menuItemStyleData: MenuItemStyleData(
            //   borderRadius: BorderRadius.circular(AppSize.radiusMedium.r)
            // ),
            valueListenable: valueListenable,
            onChanged: (value) {
              valueListenable.value = value;
            },
            items: items.map((String item) => DropdownItem<String>(
              value: item,
              height: 48,
              child: Text(
                item,
                style: context.text.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ).toList(),
          )
        ),
      ],
    );
  }
}