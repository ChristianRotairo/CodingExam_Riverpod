import 'package:femispace/features/presentation/pages/homescreen/widget/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../data/repositories/button_repositories.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cookingMethods = [
      'Raw',
      'Slow Cooked',
      'Pressure cooked',
      'Grilled',
      'Broiled',
      'Baked',
      'Roasted',
      'Sauté',
      'Boiled',
      'Poached',
      'Simmered',
      'Steamed',
      'Braised',
      'Slow Cooked',
      'Roasted',
      'Stewed',
      'Glossed',
      'Air fried',
    ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Select Meal Cooking Method'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return CookingMethodsBottomSheet(
                      cookingMethods: cookingMethods,
                    );
                  },
                );
              },
            ),

            ElevatedButton(
              child: Text('Second Screen'),
              onPressed: (){

            }, )
          ],
        ),
      ),
    );
  }
}
