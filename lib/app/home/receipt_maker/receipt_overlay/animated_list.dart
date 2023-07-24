import 'package:cashier/app/home/models/receipt.dart';
import 'package:cashier/app/home/receipt_maker/receipt_overlay/checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'animated_list_item.dart';

final PanelController panelController = PanelController();

class SimpleAnimatedList extends ConsumerWidget {
  const SimpleAnimatedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return SlidingUpPanel(
      controller: panelController,
      // onPanelClosed: () {
      //   context.read<ScannerModel>().resume();
      // },
      // onPanelOpened: () {
      //   context.read<ScannerModel>().pause();
      // },
      defaultPanelState: PanelState.CLOSED,
      color: Colors.white,
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
                return const CheckoutButton(
                  onPressed: null,
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  child: AnimatedListItem(
                    product: products[index],
                  ),
                ),
              );
            },
          ),
        );
      },
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 200,
            child: InkWell(
              onTap: () {
                panelController.open();
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                  ),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: AnimatedListItem(
                  product: Product("Product", 10.0, 1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
