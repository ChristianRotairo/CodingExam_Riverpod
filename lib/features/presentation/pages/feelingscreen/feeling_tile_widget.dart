import 'package:flutter/material.dart';
class SectionWidget extends StatelessWidget {
  final String title;
  final List<String> buttons;
  final String addButtonLabel;
  final String? selectedValue;
  final Function(String) onSelected;

  const SectionWidget({
    Key? key,
    required this.title,
    required this.buttons,
    required this.addButtonLabel,
    this.selectedValue,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: buttons.map((button) {
            return ChoiceChip(
              key: ValueKey(button), // Add a key to force rebuild
              label: Text(button),
              selected: selectedValue == button,
              onSelected: (selected) {
                onSelected(button);
              },
              selectedColor: Colors.purple, // Change selected color for all choices
              backgroundColor: selectedValue == button
                  ? Colors.purple.withOpacity(0.2) // Change background color for selected choice
                  : null, // Reset background color for unselected choices
            );
          }).toList(),
        ),
        ChoiceChip(
          label: Text(addButtonLabel),
          selected: false,
          onSelected: (selected) {
            // Handle adding custom option
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}