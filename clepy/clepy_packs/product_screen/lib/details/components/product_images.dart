import 'package:flutter/material.dart';
import 'package:product_screen/details/components/size_config.dart';

import 'constants.dart';

// ignore: use_key_in_widget_constructors
class ProductImages extends StatefulWidget {

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  List<Product> demoProducts = [
    Product(
      id: 1,
      images: [
        "assets/imagens/canon1.jpg",
        "assets/imagens/canon2.jpg",
        "assets/imagens/canon3.jpg",
        "assets/imagens/canon4.jpg",
      ],
    ),
  ];
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: 'test',
              child: Image.asset('assets/imagens/canon2.jpg'),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )*/
      ],
    );
  }

  /*GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }*/
}

class Product {
  final int id;
  final List<String> images;


  Product({
    required this.id,
    required this.images,
  });
}

// Our demo Products


