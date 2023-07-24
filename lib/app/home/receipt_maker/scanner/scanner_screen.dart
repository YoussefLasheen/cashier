import 'package:cashier/app/home/models/receipt.dart';
import 'package:cashier/app/home/models/scanner.dart';
import 'package:cashier/app/home/receipt_maker/scanner/scanner_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  ScannerHelper scannerHelper = new ScannerHelper();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scannerHelper.valueThatComesFromAProvider =
        Provider.of<ReceiptModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: QRView(
          key: Provider.of<ScannerModel>(context, listen: false).qrKey,
          overlay:
              QrScannerOverlayShape(borderColor: Colors.red, borderRadius: 10),
          onQRViewCreated: (QRViewController controller) {
            controller.scannedDataStream.listen(
              (scanData) {
                scannerHelper
                    .register(Item(id: '$scanData', name: '', price: 2));
              },
            );
          },
        ),
      ),
    );
  }
}
