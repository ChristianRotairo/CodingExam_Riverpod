import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/services/cooking_method_services.dart';

final cookingMethodsServiceProvider = Provider<CookingMethodsService>((ref) {
  return CookingMethodsService(ref);
});
