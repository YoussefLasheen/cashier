import 'package:cashier/app/home/models/receipt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Receipt {
  final DateTime createdOn;
  final List<Product> products;
  final double total;

  Receipt(
      {required this.createdOn, required this.products, required this.total});
}

class ProductsNotifier extends Notifier<List<Receipt>> {
  @override
  List<Receipt> build() {
    return [];
  }

  void add(Receipt receipt) {
    state = [receipt, ...state];
  }
}

final receiptsProvider = NotifierProvider<ProductsNotifier, List<Receipt>>(() {
  return ProductsNotifier();
});
