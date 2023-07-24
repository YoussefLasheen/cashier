import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cashier/app/home/receipt_maker/receipt_maker_page.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: ScannerPage(),
    );
  }
}
