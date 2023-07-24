import 'package:cashier/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final String name;
  final String sku;
  final Brand brand;
  final String imageUrl;
  final double price;
  final int quantity;

  Product({
    required this.name,
    required this.price,
    required this.brand,
    required this.imageUrl,
    required this.sku,
    this.quantity = 1,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      sku: map['sku'],
      imageUrl: map['image']['url'],
      price: map['price']['regularPrice']['amount']['value'],
      brand: Brand.fromMap(map['brand']),
    );
  }
}

class Brand {
  final String name;
  final String imageUrl;

  Brand({required this.name, required this.imageUrl});

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      name: map['name'],
      imageUrl: map['image_url'],
    );
  }
}

class ProductsNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  Future<void> add(String sku) async {
    ref.read(isLoadingProvider.notifier).state = true;
    await ApiService().getProductBySku(sku).then((product) {
      state = [...state, product];
      ref.read(isLoadingProvider.notifier).state = false;
    }).catchError((e) {
      ref.read(isLoadingProvider.notifier).state = false;
    });
  }
}

final productsProvider = NotifierProvider<ProductsNotifier, List<Product>>(() {
  return ProductsNotifier();
});

final isLoadingProvider = StateProvider<bool>(
  (ref) => false,
);
