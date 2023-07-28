import 'package:cashier/app/home/receipt_maker/receipt_maker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/receipts.dart';
import 'widgets/receipt_screen.dart';

class ReceiptsScreen extends ConsumerWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receipts = ref.watch(receiptsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const ScannerPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: receipts.isEmpty
          ? const Center(
              child: Text('No receipts yet'),
            )
          : ListView.builder(
              itemCount: receipts.length,
              itemBuilder: (context, index) {
                final receipt = receipts[index];
                return ListTile(
                  title: Text(receipt.createdOn.toString()),
                  subtitle: Text(receipt.products.length.toString()),
                  trailing: Text(receipt.total.toString() + 'EGP'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ReceiptScreen(receipt: receipt),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
