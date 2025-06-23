import 'dart:convert';

import 'package:flutter_riverpod_project/features/product_box/domain/product_model.dart';
import 'package:flutter_riverpod_project/features/product_box/infrastructure/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
import 'product_repository_test.mocks.dart';

void main() {
  group('ProductRepository', () {
    late MockClient mockClient;
    late ProductRepository repository;

    setUp(() async {
      ///Set up Hive for testing
      await setUpTestHive();
      // Hive.registerAdapter(ProductModelAdapter());
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(ProductModelAdapter());
      }

      await Hive.openBox<ProductModel>('product_info_box');
      mockClient = MockClient();
      repository = ProductRepository(client: mockClient);
    });

    tearDown(() async {
      await tearDownTestHive();
    });
    test(
      'returns a list of products if the http call completes successfully',
      () async {
        final responseData = [
          {
            "id": 1,
            "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
            "price": 109.95,
            "description":
                "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
            "category": "men's clothing",
            "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            "rating": {"rate": 3.9, "count": 120},
          },
        ];

        /// Mock The API call
        when(
          mockClient.get(Uri.parse('https://fakestoreapi.com/products')),
        ).thenAnswer(
          (_) async => http.Response(json.encode(responseData), 200),
        );

        /// Call the method
        final products = await repository.fetchProductsFromApi();

        /// Verify the results
        expect(products, isA<List<ProductModel>>());
        expect(products.length, 1);
        expect(products[0].id, 1);
        expect(
          products[0].title,
          "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        );
        expect(products[0].ratingValue, 4.5);
      },
    );
    test('throws an exception if the http call completes with an error', () {
      /// Mock the API call with an error response
      when(
        mockClient.get(Uri.parse('https://fakestoreapi.com/products')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      /// Verify that the call throws an exception
      expect(repository.fetchProductsFromApi(), throwsException);
    });
  });
}
