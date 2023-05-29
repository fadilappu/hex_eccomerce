// import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'hive_model_class.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final String imageUrls;

  Product(this.name, this.price, this.imageUrls);

  @override
  String toString() {
    return '$name $price';
  }
}
