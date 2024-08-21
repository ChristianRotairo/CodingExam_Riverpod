import 'package:flutter/material.dart';
import '../../../domain/services/cooking_method_services.dart';

class CookingMethodScreen extends StatefulWidget {
  final CookingMethodsService cookingMethodsService;
  final Set selectedIndices;
  final List cookingMethods;

  const CookingMethodScreen({
    Key? key,
    required this.cookingMethodsService,
    required this.selectedIndices,
    required this.cookingMethods,
  }) : super(key: key);

  @override
  _CookingMethodScreenState createState() => _CookingMethodScreenState();
}

class _CookingMethodScreenState extends State<CookingMethodScreen> {
  bool _hasShownSnackBar = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 150.0),
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
            itemCount: widget.cookingMethods.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: widget.selectedIndices.contains(index)
                        ? Colors.purple
                        : Colors.white,
                    foregroundColor: widget.selectedIndices.contains(index)
                        ? Colors.white
                        : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: widget.selectedIndices.contains(index)
                            ? Colors.purple
                            : Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                  ),
                  onPressed: () {
                    widget.cookingMethodsService.toggleSelection(index);
                    if (!_hasShownSnackBar) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cooking Method Saved'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      _hasShownSnackBar = true;
                    }
                  },
                  child: Text(
                    widget.cookingMethods[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11),
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