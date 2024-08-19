
import 'package:femispace/features/presentation/riverpod/selectionProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CookingMethodsService {
  final Ref ref;

  CookingMethodsService(this.ref);

  Set<int> get selectedIndices => ref.watch(selectedCookingMethodsProvider);

  void toggleSelection(int index) {
    final newSelectedIndices = Set<int>.from(selectedIndices);
    if (newSelectedIndices.contains(index)) {
      newSelectedIndices.remove(index);
    } else {
      newSelectedIndices.add(index);
    }
    ref.read(selectedCookingMethodsProvider.notifier).state = newSelectedIndices;
  }
}
