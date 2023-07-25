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
  Product copyWithQuantity(int? quantity) {
    return Product(
      name: name,
      sku: sku,
      imageUrl: imageUrl,
      price: price,
      brand: brand,
      quantity: quantity ?? this.quantity,
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

  void remove(String sku) {
    state = state.where((product) => product.sku != sku).toList();
  }

  void updateQuantity(String sku, int quantity) {
    if (quantity == 0) {
      remove(sku);
      return;
    }
    state = state.map((product) {
      if (product.sku == sku) {
        return product.copyWithQuantity(quantity);
      }
      return product;
    }).toList();
  }

  double calculateTotal() {
    double total = 0;
    for (var product in state) {
      total += product.price * product.quantity;
    }
    return total;
  }
}

final productsProvider = NotifierProvider<ProductsNotifier, List<Product>>(() {
  return ProductsNotifier();
});

final isLoadingProvider = StateProvider<bool>(
  (ref) => false,
);
