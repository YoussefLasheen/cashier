import 'package:flutter/widgets.dart';

class ReceiptModel extends ChangeNotifier {

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  /// Internal, private state of the cart.
  List<Item> items = [];

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Item item) {
    listKey.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 500));
    items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    for (var i = 0; i <= items.length - 1; i++) {
      listKey.currentState!.removeItem(0,
          (BuildContext context, Animation<double> animation) {
        return Container();
      });
    }
    items.clear();
 
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.price,

  });

  String id;
  String name;
  int price;
}