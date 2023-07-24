import 'package:cashier/app/home/models/receipt.dart';
import 'package:flutter/material.dart';

class AnimatedListItem extends StatelessWidget {
  final Product product;
  const AnimatedListItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Row(
          children: <Widget>[
            const Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: FlutterLogo(),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(product.name),
                  Text(product.price.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
