import 'dart:math';

import 'package:cashier/app/home/models/receipt.dart';
import 'package:cashier/app/home/models/scanner.dart';
import 'package:cashier/app/home/receipt_maker/scanner/scanner_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DummyScannerScreen extends StatefulWidget {
  @override
  _DummyScannerScreenState createState() => _DummyScannerScreenState();
}

class _DummyScannerScreenState extends State<DummyScannerScreen> {
  ScannerHelper scannerHelper = new ScannerHelper();
  var rng = Random();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scannerHelper.valueThatComesFromAProvider =
        Provider.of<ReceiptModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.white,
        child: Center(
          child: FlatButton(
            color: Colors.white,
            onPressed: (){
            scannerHelper
                      .register(Item(id: rng.nextInt(10).toString(), name: rng.nextInt(10).toString(), price: 2));
          }, child: Text("Press Me"))
        ),
      ),
    );
  }
}
