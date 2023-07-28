import 'package:cashier/app/home/models/receipts.dart';
import 'package:cashier/app/home/receipt_maker/receipt_overlay/animated_list_item.dart';
import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  final Receipt receipt;
  const ReceiptScreen({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receipt.createdOn.toString()),
      ),
      body: ListView.builder(
        itemCount: receipt.products.length,
        itemBuilder: (context, index) {
          final product = receipt.products[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.transparent,
              child: AnimatedListItem(
                product: product,
                isEditable: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
