import '../model/hive_model_class.dart';

Map<Product, int> selectedQuantities = {};

class TotalPriceCalculator {
  double calculateTotalPrice(){
    double totalPrice = 0;
    for (final entry in selectedQuantities.entries) {
      final product = entry.key;
      final quantity = entry.value;
      totalPrice += product.price * quantity;
    }
    return totalPrice;
  }
}
