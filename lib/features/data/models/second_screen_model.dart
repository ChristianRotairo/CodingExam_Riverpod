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

