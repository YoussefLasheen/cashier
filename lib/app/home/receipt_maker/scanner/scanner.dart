import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:cashier/app/home/models/receipt.dart';
import 'package:cashier/app/home/models/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanning_effect/scanning_effect.dart';

class Scanner extends ConsumerWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        MobileScanner(
          controller: ref.watch(scannerControllerProvider),
          onDetect: (capture) async {
            final List<Barcode> barcodes = capture.barcodes;
            if (barcodes.isEmpty) return;
            log(barcodes.first.displayValue!, name: "Barcode");
            await player.play(AssetSource('sounds/beep.mp3'));
            ref
                .read(productsProvider.notifier)
                .add(barcodes.first.displayValue!);
          },
        ),
        const Positioned(
          left: 0,
          right: 0,
          top: 150,
          child: SizedBox(
            height: 250,
            child: ScanningEffect(
              scanningColor: Colors.red,
              borderLineColor: Colors.black,
              scanningHeightOffset: 0.4,
              child: SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}

final player = AudioPlayer();
