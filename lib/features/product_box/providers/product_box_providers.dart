import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/features/product_box/application/product_box_controller.dart';
import 'package:flutter_riverpod_project/features/product_box/domain/product_model.dart';
import 'package:flutter_riverpod_project/features/product_box/infrastructure/product_repository.dart';

final repositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final productBoxControllerProvider =
    StateNotifierProvider<ProductBoxController, List<ProductModel>>((ref) {
      final repo = ref.watch(repositoryProvider);
      return ProductBoxController(repo);
    });
