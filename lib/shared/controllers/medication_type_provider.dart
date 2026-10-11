import 'package:flutter_riverpod/flutter_riverpod.dart';

class MedicationTypeNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return _initial;
  }

  List<String> _initial = ['Tablet', 'Capsule', 'Liquid', 'Injection'];

  void addMedication(String medication) {
    state = [medication, ...state];
  }

  // TODO ADD FUNCTION SQLITE LATER FOR INITIAL WITH UNIQUE ID ON IT

}

final MedicationTypeProvider = NotifierProvider.autoDispose(MedicationTypeNotifier.new);