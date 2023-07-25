import 'package:cashier/app/constants.dart';
import 'package:cashier/app/home/models/receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class AnimatedListItem extends ConsumerWidget {
  final Product product;
  final bool isMain;
  const AnimatedListItem({
    super.key,
    required this.product,
    this.isMain = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                product.imageUrl,
                height: 75,
                width: 75,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${product.price.toStringAsFixed(2)}EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox(
              height: 40,
              width: 125,
              child: SpinBox(
                spacing: 0,
                iconSize: 20,
                showCursor: false,
                decrementIcon: product.quantity == 1
                    ? const Icon(
                        Icons.delete,
                      )
                    : null,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15),
                  isCollapsed: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  filled: true,
                ),
                min: 0,
                max: maxQuantity.toDouble(),
                value: product.quantity.toDouble(),
                onChanged: (value) {
                  ref.watch(productsProvider.notifier).updateQuantity(
                        product.sku,
                        value.toInt(),
                      );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
