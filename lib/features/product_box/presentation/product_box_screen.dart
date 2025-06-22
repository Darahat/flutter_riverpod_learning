import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/product_box_providers.dart';
import 'product_list.dart';

class ProductBoxScreen extends ConsumerStatefulWidget {
  const ProductBoxScreen({super.key});

  @override
  ConsumerState<ProductBoxScreen> createState() => _ProductBoxScreenState();
}

class _ProductBoxScreenState extends ConsumerState<ProductBoxScreen> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productBoxControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hive + Riverpod Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [Expanded(child: ProductList(products: products))],
        ),
      ),
    );
  }
}
