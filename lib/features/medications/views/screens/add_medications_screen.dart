import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/enum.dart';
import 'package:mend/core/constants/padding_size.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/features/medications/controllers/add_medication_step_provider.dart';
import 'package:mend/features/medications/views/widgets/add_medication_step_1.dart';
import 'package:mend/features/medications/views/widgets/add_medication_step_2.dart';
import 'package:mend/shared/widgets/app_bar.dart';
import 'package:mend/shared/widgets/button.dart';
import 'package:mend/shared/widgets/step_progress.dart';

class AddMedicationsScreen extends ConsumerWidget {
  const AddMedicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addMedicationState = ref.watch(addMedicationStepProvider);

    return Scaffold(
      appBar: MyAppBar(
        title: 'Add Medications', 
        subTitle: 'Step ${addMedicationState.currentStep+1} of 3',
        bottom: StepProgressBar(
          totalSteps: 3,
          currentStep: addMedicationState.currentStep,
        ),
      ),
      body: Padding(
        padding: AppPadding.screen,
        child: PageView(
          controller: ref.read(addMedicationStepProvider.notifier).controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            AddMedicationStep1(),
            AddMedicationStep2(),
            Placeholder(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: AppSize.navigationBarHeight.h,
          padding: AppPadding.horizontal,
          child: Row(
            spacing: AppSize.mediumSmall.w,
            children: [
              if(addMedicationState.currentStep>0) Expanded(
                child: MyButton(
                  buttonType: ButtonType.outlined,
                  text: 'Cancel',
                  onPressed: () => ref.read(addMedicationStepProvider.notifier).previousStep(),
                ),
              ),
              Expanded(
                child: MyButton(
                  text: 'Continue',
                  onPressed: () => ref.read(addMedicationStepProvider.notifier).nextStep(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

