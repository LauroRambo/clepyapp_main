import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  ClepyProduct clepyProduct;
  ProductTile({Key? key, required this.clepyProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(clepyProduct.name),
    );
  }
}
