// ignore_for_file: override_on_non_overriding_member, duplicate_ignore

import 'package:hive_flutter/hive_flutter.dart';
import '../model/hive_model_class.dart';

// final CartDataStoring _cartData = CartDataStoring();

  // ignore: constant_identifier_names
  const CART_BOX = 'cart-box';

abstract class CartData {
  Future<List<Product>> getProduct();
  Future<void> insertProduct(Product value);
}

// ignore: duplicate_ignore
class CartDataStoring implements CartData {
  @override
  Future<void> insertProduct(Product value) async {
    final cartDB = await Hive.openBox<Product>(CART_BOX);
    await cartDB.add(value);
  }

  @override
  Future<List<Product>> getProduct() async {
    final cartDB = await Hive.openBox<Product>(CART_BOX);
    return cartDB.values.toList();
  }

// ignore: override_on_non_overriding_member
  @override
  Future<void> removeProduct(Product product) async {
    final cartDB = await Hive.openBox<Product>(CART_BOX);
    final index =
        cartDB.values.toList().indexWhere((p) => p.name == product.name);
    if (index != -1) {
      await cartDB.deleteAt(index);
    }
  }
}
