import 'package:cashier/app/home/receipt_maker/scanner/dummy_scanner.dart';
import 'package:flutter/material.dart';

import 'receipt_overlay/receipt_overlay_screen.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[DummyScannerScreen(), ReceiptOverlayScreen()],
      ),
    );
  }
}
