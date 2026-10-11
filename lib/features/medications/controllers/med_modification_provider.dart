import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mend/core/constants/enum.dart';
import 'package:mend/core/constants/icons.dart';

class MedicationActionOption {
  MedicationActionOption({
    required this.value,
    required this.title,
    required this.icon,
  });

  final MedicationAction value;
  final String title;
  final String icon;
}
  

class MedModificationNotifier extends Notifier<MedicationAction?> {
  @override
  MedicationAction? build() {
    return null;
  }

  List<MedicationActionOption> options = [
    MedicationActionOption(
      value: MedicationAction.details,
      title: 'View Details',
      icon: AppIcon.svgInfo,
    ),
    MedicationActionOption(
      value: MedicationAction.edit,
      title: 'Edit Medication',
      icon: AppIcon.svgEdit,
    ),
    MedicationActionOption(
      value: MedicationAction.pause,
      title: 'Pause Reminders',
      icon: AppIcon.svgPause,
    ),
    MedicationActionOption(
      value: MedicationAction.delete,
      title: 'Delete',
      icon: AppIcon.svgBin,
    ),

  ];

  void setSelectedOption(MedicationAction action) => state = action;
  
}

final MedModificationProvider = NotifierProvider(MedModificationNotifier.new);