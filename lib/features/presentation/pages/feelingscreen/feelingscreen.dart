import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/second_screen.dart';
import 'feeling_tile_widget.dart';


class FeelingScreenContent extends ConsumerWidget {
  const FeelingScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionState = ref.watch(selectionProvider);
    final selectionNotifier = ref.read(selectionProvider.notifier);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10), // Responsive spacing
            SectionWidget(
              title: 'Feeling',
              buttons: const ['Good', 'Bloating', 'Nausea', 'Heave'],
              addButtonLabel: 'Add Other Feeling',
              selectedValue: selectionState.selectedFeeling,
              onSelected: (value) {
                selectionNotifier.updateFeeling(value);
              },
            ),
            SectionWidget(
              title: 'Where',
              buttons: const ['Desk', 'On the go', 'Dinner table'],
              addButtonLabel: 'Add Other Place',
              selectedValue: selectionState.selectedPlace,
              onSelected: (value) {
                selectionNotifier.updatePlace(value);
              },
            ),
            SectionWidget(
              title: 'Time to consume',
              buttons: const ['5min', '10min', '20min', '30min'],
              addButtonLabel: 'Select Other Time',
              selectedValue: selectionState.selectedTime,
              onSelected: (value) {
                selectionNotifier.updateTime(value);
              },
            ),
            SectionWidget(
              title: 'Select Meal Cooking Method',
              buttons: const ['Raw', 'Slow Cooked', 'Roasted'],
              addButtonLabel: 'Select Other Cooking Method',
              selectedValue: selectionState.selectedMethod,
              onSelected: (value) {
                selectionNotifier.updateMethod(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}