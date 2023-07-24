import 'package:cashier/app/home/models/receipt.dart';
import 'package:cashier/app/home/models/scanner.dart';
import 'package:cashier/app/home/receipt_maker/scanner/dummy_scanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'receipt_overlay/receipt_overlay_screen.dart';
import 'scanner/scanner_screen.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ReceiptModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => ScannerModel(),
          ),
        ],
        child: Stack(
          children: <Widget>[DummyScannerScreen(), ReceiptOverlayScreen()],
        ),
      ),
    );
  }
}
