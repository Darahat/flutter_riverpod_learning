import 'dart:convert';

import 'package:flutter_riverpod_project/core/constants/hive_constants.dart';
import 'package:flutter_riverpod_project/features/product_box/domain/product_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final Box<ProductModel> _box = Hive.box<ProductModel>(
    HiveConstants.productInfoBox,
  );
  final http.Client client;
  ProductRepository({http.Client? client})
    : this.client = client ?? http.Client();

  List<ProductModel> getEntries() => _box.values.toList();

  Future<void> addEntry(ProductModel entry) async {
    await _box.add(entry);
  }

  /// Fetch products from the Api
  Future<List<ProductModel>> fetchProductsFromApi() async {
    final response = await client.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final product = data.map((item) => ProductModel.fromJson(item)).toList();
      return product;
    } else {
      throw Exception('Failed to load products');
    }
  }

  /// Fetch and cache into Hive
  Future<void> fetchAndCacheProducts() async {
    final products = await fetchProductsFromApi();
    for (final product in products) {
      await addEntry(product);
    }
  }
}
