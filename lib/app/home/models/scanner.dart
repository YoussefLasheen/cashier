import 'package:cashier/app/home/models/receipt.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerModel extends ChangeNotifier {
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  void pause(){
    controller.pauseCamera();
    notifyListeners();
  }

  
  void resume(){
    controller.resumeCamera();
  }

  void flipCamera(){
    controller.flipCamera();
    notifyListeners();
  }


  void toggleFlash(){
    controller.toggleFlash();
    notifyListeners();
  }
}