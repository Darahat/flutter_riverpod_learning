import 'package:flutter/material.dart';

import '../domain/product_model.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text('No entries yet.'));
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) => ListTile(title: Text(products[index].title)),
    );
  }
}
