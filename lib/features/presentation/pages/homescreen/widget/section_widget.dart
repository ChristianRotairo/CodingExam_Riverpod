import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List<String> buttons;
  final String addButtonLabel;
  final String selectedValue;
  final ValueChanged<String> onSelected;

  const SectionWidget({
    Key? key,
    required this.title,
    required this.buttons,
    required this.addButtonLabel,
    required this.selectedValue,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: buttons.map((label) {
              return ChoiceChip(
                label: Text(label),
                selected: selectedValue == label,
                onSelected: (selected) {
                  onSelected(label);
                },
                selectedColor: Colors.purple,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: selectedValue == label ? Colors.white : Colors.black,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: selectedValue == label ? Colors.purple : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {
              // Handle add button press
            },
            icon: const Icon(Icons.add, color: Colors.purple),
            label: Text(
              addButtonLabel,
              style: const TextStyle(color: Colors.purple),
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: const BorderSide(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
