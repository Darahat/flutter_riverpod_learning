import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/features/product_box/domain/product_model.dart';
import 'package:flutter_riverpod_project/features/product_box/infrastructure/product_repository.dart';

class ProductBoxController extends StateNotifier<List<ProductModel>> {
  ProductBoxController(this.repository) : super(repository.getEntries());
  final ProductRepository repository;

  // Future<void> addEntry({required String product}) async {
  //   final entry = ProductModel(
  //     id: 0,
  //     title: product,
  //     description: product,
  //     price: 0.0,
  //     category: product,
  //     image: product,
  //     ratingValue: 0.0,
  //     ratingCount: 0,
  //   );
  //   state = repository.getEntries();
  // }

  Future<void> fetchAndCacheProducts() async {
    await repository.fetchAndCacheProducts();
    state = repository.getEntries();
  }
}
