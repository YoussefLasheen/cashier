import 'dart:developer';

import 'package:cashier/app/home/models/receipt.dart';
import 'package:cashier/app/home/models/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends ConsumerWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MobileScanner(
      controller: ref.watch(scannerControllerProvider),
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        if (barcodes.isEmpty) return;
        log(barcodes.first.displayValue!, name: "Barcode");
        ref.read(productsProvider.notifier).add(Product(
              name: barcodes.first.displayValue!,
              price: 0,
              quantity: 1,
            ));
      },
    );
  }
}
