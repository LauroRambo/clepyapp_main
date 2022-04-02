import 'package:flutter/material.dart';

import 'Product.dart';
import 'Product.dart';

class Rent {
  final Product product;
  final int numOfItem;

  Rent({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Rent> demoRent = [
  Rent(product: demoProducts[0], numOfItem: 1),
];
