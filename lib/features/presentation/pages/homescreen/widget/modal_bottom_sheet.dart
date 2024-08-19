import 'package:femispace/features/data/repositories/button_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CookingMethodsBottomSheet extends ConsumerStatefulWidget {
  final List<String> cookingMethods;

  const CookingMethodsBottomSheet({
    required this.cookingMethods,
    super.key,
  });

  @override
  ConsumerState<CookingMethodsBottomSheet> createState() =>
      _CookingMethodsBottomSheetState();
}

class _CookingMethodsBottomSheetState
    extends ConsumerState<CookingMethodsBottomSheet> {
  bool _hasShownSnackbar =
      false; // Flag to track if the Snackbar has been shown

  @override
  void dispose() {
    _hasShownSnackbar = false; // Reset the flag when the modal is closed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cookingMethodsService = ref.watch(cookingMethodsServiceProvider);
    final selectedIndices = cookingMethodsService.selectedIndices;

    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(
            color: Colors.grey,
            height: 50,
            thickness: 3,
            indent: 150,
            endIndent: 150,
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(right: 170.0, top:20),
            child: const Text(
              'Select Meal Cooking Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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
                      if (!_hasShownSnackbar) {
                        _hasShownSnackbar = true; // Set the flag to true
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
                                      'Cooking method saved',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: Text(
                      widget.cookingMethods[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left:100.0, right: 100),
            
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 15), // Adjust text size if needed
                ),
              ),
            
          )
        ],
      ),
    );
  }
}
