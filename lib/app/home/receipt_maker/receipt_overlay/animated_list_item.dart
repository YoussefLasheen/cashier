import 'package:cashier/app/home/models/receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class AnimatedListItem extends StatelessWidget {
  final Product product;
  final bool isMain;
  const AnimatedListItem({
    super.key,
    required this.product,
    this.isMain = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        dense: !isMain,
        visualDensity: !isMain ? VisualDensity.compact : null,
        isThreeLine: true,
        contentPadding: EdgeInsets.only(left: 15),
        leading: AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
        title: Text(
          product.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '${product.price} EGP',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 100,
              child: SpinBox(
                direction: Axis.horizontal,
                showCursor: false,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                ),
                spacing: 0,
                min: 1,
                max: 9,
                value: 1,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
