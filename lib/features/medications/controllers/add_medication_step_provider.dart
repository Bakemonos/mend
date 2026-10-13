import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMedicationStepState {
  const AddMedicationStepState({
    this.currentStep = 0,
  });

  final int currentStep;

  AddMedicationStepState copyWith({
    int? currentStep
  }) {
    return AddMedicationStepState(
      currentStep: currentStep ?? this.currentStep,
    );
  }
}

class AddMedicationStepNotifier extends Notifier<AddMedicationStepState> {
  static const int lastStep = 2;
  late final PageController controller;

  @override
  AddMedicationStepState build() {
    controller = PageController();
    ref.onDispose(controller.dispose);
    return const AddMedicationStepState();
  }

  void nextStep() {
    if (state.currentStep < lastStep) {
      state = state.copyWith(currentStep: state.currentStep + 1);
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
      controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

final addMedicationStepProvider = NotifierProvider(AddMedicationStepNotifier.new);