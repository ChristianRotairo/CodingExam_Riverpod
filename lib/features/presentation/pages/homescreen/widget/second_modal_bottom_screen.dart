import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/second_screen_model.dart';
import '../../../riverpod/second_screen.dart';
import 'section_widget.dart'; 

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionState = ref.watch(selectionProvider);
    final selectionNotifier = ref.read(selectionProvider.notifier);

    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionWidget(
              title: 'Feeling',
              buttons: ['Good', 'Bloating', 'Nausea', 'Heave'],
              addButtonLabel: 'Add Other Feeling',
              selectedValue: selectionState.selectedFeeling,
              onSelected: (value) {
                selectionNotifier.updateFeeling(value);
              },
            ),
            SectionWidget(
              title: 'Where',
              buttons: ['Desk', 'On the go', 'Dinner table'],
              addButtonLabel: 'Add Other Place',
              selectedValue: selectionState.selectedPlace,
              onSelected: (value) {
                selectionNotifier.updatePlace(value);
              },
            ),
            SectionWidget(
              title: 'Time to consume',
              buttons: ['5min', '10min', '20min', '30min'],
              addButtonLabel: 'Select Other Time',
              selectedValue: selectionState.selectedTime,
              onSelected: (value) {
                selectionNotifier.updateTime(value);
              },
            ),
            SectionWidget(
              title: 'Select Meal Cooking Method',
              buttons: ['Raw', 'Slow Cooked', 'Roasted'],
              addButtonLabel: 'Select Other Cooking Method',
              selectedValue: selectionState.selectedMethod,
              onSelected: (value) {
                selectionNotifier.updateMethod(value);
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  _showConfirmationDialog(context, selectionNotifier);
                },
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, SelectionNotifier selectionNotifier) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to save your selections?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                // Reset selections or perform another action here
                selectionNotifier.resetSelections();
                Navigator.of(context).pop(); // Close the dialog

                // Close the bottom sheet
                Navigator.of(context).pop();

                // Show the Snackbar
                 ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: const Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Selection saved successfully',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );

                // Navigate back to the home screen
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }
}
