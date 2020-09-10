import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:cashier/app/home/models/receipt.dart';
class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.1,
      width: double.infinity,
      child: FlatButton(
        color: Colors.black,
        onPressed: () {
          var receipt = context.read<ReceiptModel>();
          receipt.removeAll();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "CHECKOUT",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 30,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
