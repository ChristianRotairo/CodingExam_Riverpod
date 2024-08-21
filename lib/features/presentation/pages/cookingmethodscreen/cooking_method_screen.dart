import 'package:flutter/material.dart';
import '../../../domain/services/cooking_method_services.dart';


class ViewDetailsContent extends StatelessWidget {
  final CookingMethodsService cookingMethodsService;
  final Set<int> selectedIndices;
  final List<String> cookingMethods;

  const ViewDetailsContent({
    Key? key,
    required this.cookingMethodsService,
    required this.selectedIndices,
    required this.cookingMethods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 170.0),
          child: Text(
            'Select Meal Cooking Method',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2.6,
            ),
            itemCount: cookingMethods.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: selectedIndices.contains(index)
                        ? Colors.purple
                        : Colors.white,
                    foregroundColor: selectedIndices.contains(index)
                        ? Colors.white
                        : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: selectedIndices.contains(index)
                            ? Colors.purple
                            : Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                  ),
                  onPressed: () {
                    cookingMethodsService.toggleSelection(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Information Saved'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Text(
                    cookingMethods[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
