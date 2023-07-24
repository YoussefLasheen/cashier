import 'dart:math';

import 'package:cashier/app/home/models/receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DummyScannerScreen extends ConsumerWidget {
  const DummyScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: Container(
        color: Colors.black,
        child: Center(
            child: TextButton(
                onPressed: () {
                  ref
                      .read(productsProvider.notifier)
                      .add(Product("Product", 10.0, 1));
                },
                child: const Text("Press Me"))),
      ),
    );
  }
}
