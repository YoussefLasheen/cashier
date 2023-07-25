import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckoutButton extends ConsumerWidget {
  final VoidCallback? onPressed;
  const CheckoutButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size.fromHeight(50),
      ),
      onPressed: onPressed,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "CHECKOUT",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 30,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
