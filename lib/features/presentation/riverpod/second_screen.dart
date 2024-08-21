import 'package:femispace/features/data/models/second_screen_model.dart';
import 'package:femispace/features/presentation/riverpod/select_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectionProvider = StateNotifierProvider<SelectionNotifier, SelectionState>(
  (ref) => SelectionNotifier(),
);
