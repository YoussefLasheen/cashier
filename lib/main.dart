import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cashier/app/home/receipt_maker/receipt_maker_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: const ScannerPage(),
    );
  }
}
