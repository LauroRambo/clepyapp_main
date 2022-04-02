import 'package:flutter/material.dart';
import 'package:product_screen/details/components/size_config.dart';
import 'default_button.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    /*ColorDots(product: product),*/
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Conferir disponibilidade",
                          press: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
