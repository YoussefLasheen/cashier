import 'package:cashier/app/home/models/receipt.dart';

class ScannerHelper {
  Item pastRegister;
  var valueThatComesFromAProvider;
  void register(Item item) {
    if ((pastRegister == null) || (item.id != pastRegister.id)) {
      pastRegister = item;
      var receipt = valueThatComesFromAProvider;

      receipt.add(item);
    }
  }
}
