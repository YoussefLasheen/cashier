import 'package:cashier/app/home/receipt_maker/scanner/scanner.dart';
import 'package:flutter/material.dart';

import 'receipt_overlay/receipt_overlay.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[Scanner(), ReceiptOverlay()],
      ),
    );
  }
}
