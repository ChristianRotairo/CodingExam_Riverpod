// Define the StateNotifier
import 'package:femispace/features/data/models/second_screen_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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