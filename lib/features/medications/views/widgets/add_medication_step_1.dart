import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/icons.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/extentions/context_extentions.dart';
import 'package:mend/features/medications/views/widgets/add_medication_title.dart';
import 'package:mend/shared/controllers/medication_type_provider.dart';
import 'package:mend/shared/widgets/dropdown.dart';
import 'package:mend/shared/widgets/svg.dart';
import 'package:mend/shared/widgets/text_field.dart';

class AddMedicationStep1 extends StatelessWidget {
  const AddMedicationStep1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddMedicationTitle(
          icon: AppIcon.svgPill,
          title: 'Medication details',
          subtitle: "Let's start with the basics. You can update these later.",
        ),
        SizedBox(height: AppSize.large.h),
    
        MyTextField(
          label: 'Medication name',
          hintText: 'e.g. Paracetamol',
        ),
        SizedBox(height: AppSize.medium.h),
        Row(
          spacing: AppSize.mediumSmall.w,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: MyTextField(
                label: 'Dosage',
                hintText: 'e.g. 500',
              ),
            ),
            Expanded(
              child: MyDropDown(
                hint: 'Unit',
                items: const ['mg', 'mcg', 'g', 'ml', 'IU'],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.medium.h),
    
        Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(MedicationTypeProvider);
            final notifier = ref.read(MedicationTypeProvider.notifier);
            
            return Column(
              spacing: AppSize.small.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medication Type', style: context.text.labelMedium),
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: AppSize.small.w,
                      runSpacing: AppSize.small.h,
                      children: [
                        for (final type in state.medicationTypes)
                          _TypeTile(
                            label: type.type,
                            icon: MySvg(assetPath: type.icon, size: AppSize.iconSmall.w),
                            selected: state.selectedMedicationType == type,
                            onTap: () => notifier.selectMedicatioType(type),
                          ),
                        _TypeTile(
                          label: 'Other',
                          icon: Icon(AppIcon.iconAdd, size: AppSize.iconSmall.w),
                          onTap: () {

                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
        SizedBox(height: AppSize.medium.h),

        MyTextField(
          label: 'Instructions (optional)',
          hintText: 'e.g. Take with food',
          minLines: 3,
          maxLines: 5,
          textCapitalization: TextCapitalization.sentences,
        )
      ],
    );
  }
}


class _TypeTile extends StatelessWidget {
  const _TypeTile({
    required this.label,
    required this.icon,
    required this.onTap,
    this.selected = false,
  });

  final String label;
  final Widget icon;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppSize.radiusSmall.r);
    final accent = selected ? colors.primary : colors.onSurface;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          color: selected ? colors.primary.withValues(alpha: 0.12) : null,
          borderRadius: radius,
          border: Border.all(
            width: AppSize.borderTiny.w,
            color: selected ? colors.primary : colors.outline,
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            borderRadius: radius,
            child: IconTheme(
              data: IconThemeData(color: accent),
              child: Column(
                spacing: AppSize.small.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  Text(
                    label,
                    style: context.text.bodySmall?.copyWith(
                      color: accent,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

