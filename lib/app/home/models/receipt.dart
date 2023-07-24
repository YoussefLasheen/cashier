import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final String name;
  final double price;
  final int quantity;

  Product({required this.name, required this.price, this.quantity = 1});
}

class ProductsNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  void add(Product todo) {
    state = [...state, todo];
  }
}

final productsProvider = NotifierProvider<ProductsNotifier, List<Product>>(() {
  return ProductsNotifier();
});
