import 'package:cashier/app/home/models/receipt.dart';
import 'package:cashier/app/home/models/receipts.dart';
import 'package:cashier/app/home/models/scanner.dart';
import 'package:cashier/app/home/receipt_maker/receipt_overlay/checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'animated_list_item.dart';

final PanelController panelController = PanelController();

class ReceiptOverlay extends ConsumerWidget {
  const ReceiptOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final cameraController = ref.watch(scannerControllerProvider);
    final isLoading = ref.watch(isLoadingProvider);

    return SlidingUpPanel(
      controller: panelController,
      onPanelClosed: () {
        cameraController.start();
      },
      onPanelOpened: () {
        cameraController.stop();
      },
      defaultPanelState: PanelState.CLOSED,
      color: Theme.of(context).colorScheme.background,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height,
      panelBuilder: (ScrollController scrollController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: products.length + 1,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              if (index == products.length) {
                return Column(
                  children: [
                    Table(
                      children: [
                        TableRow(
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "${ref.watch(productsProvider.notifier).calculateTotal().toStringAsFixed(2)}EGP",
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CheckoutButton(
                      onPressed: () {
                        ref.read(receiptsProvider.notifier).add(
                              Receipt(
                                createdOn: DateTime.now(),
                                products: products,
                                total: ref
                                    .watch(productsProvider.notifier)
                                    .calculateTotal(),
                              ),
                            );
                        ref.read(productsProvider.notifier).clear();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.transparent,
                  child: AnimatedListItem(
                    product: products[index],
                  ),
                ),
              );
            },
          ),
        );
      },
      body: isLoading
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  height: 200,
                  decoration: ShapeDecoration(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                    ),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            )
          : products.isEmpty
              ? null
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: GestureDetector(
                      onTap: () {
                        panelController.open();
                      },
                      child: Container(
                        height: 200,
                        decoration: ShapeDecoration(
                            shape: const ContinuousRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(85)),
                            ),
                            color: Colors.white),
                        child: Center(
                          child: AnimatedListItem(
                            product: products.first,
                            isMain: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
