import 'package:femispace/features/presentation/riverpod/button_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../cookingmethodscreen/cooking_method_screen.dart';
import '../feelingscreen/feelingscreen.dart';

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
    extends ConsumerState<CookingMethodsBottomSheet>
    with SingleTickerProviderStateMixin {
  bool _isViewDetails = true;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
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
          const SizedBox(height: 16),
          _buildToggleButtons(),
          const SizedBox(height: 10),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _isViewDetails
                ? CookingMethodScreen(
                    cookingMethodsService: cookingMethodsService,
                    selectedIndices: selectedIndices,
                    cookingMethods: widget.cookingMethods,
                  )
                : const FeelingScreenContent(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0, right: 100),
            child: FloatingActionButton(
              onPressed: () {
                // Show the snackbar message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Information saved'),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 3),
                  ),
                );

                // Navigate back
                Navigator.pop(context);
              },
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  

  Widget _buildToggleButtons() {
    return Center(
      child: ToggleButtons(
        fillColor: Colors.purple, // Color for the selected button
        borderRadius: BorderRadius.circular(20),
        isSelected: [_isViewDetails, !_isViewDetails],
        onPressed: (int index) {
          setState(() {
            _isViewDetails = index == 0;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Cooking Methods',
              style: TextStyle(
                color: _isViewDetails ? Colors.white : Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Feelings',
              style: TextStyle(
                color: !_isViewDetails ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
