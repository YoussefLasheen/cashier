import 'package:cashier/app/home/models/receipt.dart';
import 'package:flutter/material.dart';

class AnimatedListItem extends StatelessWidget {
  final animation;
  final Item item;
  final listItemExtent;
  const AnimatedListItem(
    this.animation,
    this.item,
    this.listItemExtent,
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animation,
      child: SizedBox(
        height: screenHeight * listItemExtent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Row(
              children: <Widget>[
                Expanded(child: Placeholder()),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text(item.name), Text(item.price.toString())],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
