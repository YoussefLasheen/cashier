import 'package:cashier/app/home/models/receipt.dart';
import 'package:cashier/app/home/models/scanner.dart';
import 'package:cashier/app/home/receipt_maker/receipt_overlay/checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'animated_list_item.dart';

class SimpleAnimatedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double listItemExtent = 0.2;
    return Consumer<ReceiptModel>(
      builder: (context, receipt, child) {
        return SlidingUpPanel(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(50)),
          onPanelClosed: () {
            context.read<ScannerModel>().resume();
          },
          onPanelOpened: () {
            context.read<ScannerModel>().pause();
          },
          defaultPanelState: PanelState.OPEN,
          color: Colors.black,
          maxHeight: maxHeighCalculator(
              receipt.items.length, listItemExtent, screenHeight),
          minHeight: receipt.items.length != 0
              ? screenHeight * listItemExtent
              : 0,
          panelBuilder: (ScrollController scrollController) {
            return AnimatedList(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              key: receipt.listKey,
              initialItemCount: receipt.items.length,
              itemBuilder: (context, index, animation) {
                bool isFirst = index == 0;
                bool isLast = index == receipt.items.length - 1;
                return Column(
                  children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: !isFirst?Radius.circular(0):Radius.circular(50),
                            topLeft: !isFirst?Radius.circular(0):Radius.circular(50),
                            bottomRight: !isLast?Radius.circular(0):Radius.circular(50),
                            bottomLeft: !isLast?Radius.circular(0):Radius.circular(50)),
                        child: AnimatedListItem(
                          animation,
                          receipt.items[index],
                          listItemExtent,
                        ),
                      ),
                    if (index == receipt.items.length - 1) CheckoutButton(),
                  ],
                );
                /*
                if(index == receipt.items.length - 1 || receipt.items.length == 1){
                  return Container(
                    color: Colors.black,
                    child: Column(
                      children: <Widget>[
                        Container(child: AnimatedListItem(animation, receipt.items[index], listItemExtent, null)),
                        CheckoutButton(),
                      ],
                    ),
                  );
                }
                if(index == 0){
                return AnimatedListItem(animation, receipt.items[index], listItemExtent, null);  
                }
                return AnimatedListItem(animation, receipt.items[index], listItemExtent, null);
                */
              },
            );
          },
        );
      },
    );
  }

  double maxHeighCalculator(
      int listSize, double itemExtentPercentage, double screenHeight) {
    int screenFit = (1 ~/ itemExtentPercentage).toInt();
    if (listSize == 0) {
      return 0.0;
    } else if (listSize >= screenFit) {
      return screenHeight;
    } else {
      return (((listSize * itemExtentPercentage) + 0.10) * screenHeight);
    }
  }
}
