import 'package:flutter/material.dart';

import '../domain/product_model.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text('No products available. Pull to refresh.'),
      );
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: Image.network(
            products[index].image,
            width: 60,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported, size: 60),
          ),
          title: Text(
            products[index].title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '\$${products[index].price.toStringAsFixed(2)}\n'
            '${products[index].category}',
          ),
          isThreeLine: true,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text('${products[index].ratingValue}'),
            ],
          ),
        ),
      ),
    );
  }
}
