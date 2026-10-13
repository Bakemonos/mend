// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mend/core/constants/icons.dart';

class MedicationType {
  MedicationType({
    required this.type,
    required this.icon,
  });

  final String type;
  final String icon;
} 

class MedicationTypeState {
  MedicationTypeState({
    required this.medicationTypes,
    this.selectedMedicationType,
  });

  final List<MedicationType> medicationTypes;
  final MedicationType? selectedMedicationType;

  MedicationTypeState copyWith({
    List<MedicationType>? medicationTypes,
    MedicationType? selectedMedicationType,
  }) {
    return MedicationTypeState(
      medicationTypes: medicationTypes ?? this.medicationTypes,
      selectedMedicationType: selectedMedicationType ?? this.selectedMedicationType,
    );
  }
}

class MedicationTypeNotifier extends Notifier<MedicationTypeState> {

  @override
  MedicationTypeState build() {
    return MedicationTypeState(
      medicationTypes: _initial,
    );
  }

  List<MedicationType> _initial = [
    MedicationType(type: 'Tablet', icon: AppIcon.svgPill),
    MedicationType(type: 'Capsule', icon: AppIcon.svgPill),
    MedicationType(type: 'Liquid', icon: AppIcon.svgPill),
    MedicationType(type: 'Injection', icon: AppIcon.svgPill),
  ];

  void selectMedicatioType(MedicationType type) {
    state = state.copyWith(selectedMedicationType: type);
  }

  void addMedication(MedicationType medication) {
    state = state.copyWith(
      medicationTypes:  [medication, ...state.medicationTypes]
    );
  }


}

final MedicationTypeProvider = NotifierProvider.autoDispose(MedicationTypeNotifier.new);