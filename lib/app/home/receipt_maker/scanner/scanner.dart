import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
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
      onDetect: (capture) async {
        final List<Barcode> barcodes = capture.barcodes;
        if (barcodes.isEmpty) return;
        log(barcodes.first.displayValue!, name: "Barcode");

        await player.play(AssetSource('sounds/beep.mp3'));
        ref.read(productsProvider.notifier).add(barcodes.first.displayValue!);
      },
    );
  }
}

final player = AudioPlayer();
