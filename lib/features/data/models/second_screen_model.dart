import 'package:flutter_riverpod/flutter_riverpod.dart';
class SelectionState {
  final String selectedFeeling;
  final String selectedPlace;
  final String selectedTime;
  final String selectedMethod;

  SelectionState({
    this.selectedFeeling = 'Good',
    this.selectedPlace = 'Desk',
    this.selectedTime = '5min',
    this.selectedMethod = 'Raw',
  });

  SelectionState copyWith({
    String? selectedFeeling,
    String? selectedPlace,
    String? selectedTime,
    String? selectedMethod,
  }) {
    return SelectionState(
      selectedFeeling: selectedFeeling ?? this.selectedFeeling,
      selectedPlace: selectedPlace ?? this.selectedPlace,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedMethod: selectedMethod ?? this.selectedMethod,
    );
  }
}

// Define the StateNotifier
class SelectionNotifier extends StateNotifier<SelectionState> {
  SelectionNotifier() : super(SelectionState());

  void updateFeeling(String newFeeling) {
    state = state.copyWith(selectedFeeling: newFeeling);
  }

  void updatePlace(String newPlace) {
    state = state.copyWith(selectedPlace: newPlace);
  }

  void updateTime(String newTime) {
    state = state.copyWith(selectedTime: newTime);
  }

  void updateMethod(String newMethod) {
    state = state.copyWith(selectedMethod: newMethod);
  }

  void resetSelections() {}

  void saveSelections() {}
}