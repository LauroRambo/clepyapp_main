import 'package:clepy_ui/clepy_ui.dart';
import 'package:domain/entities/clepy_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductTile extends StatelessWidget {
  final ClepyProduct product;
  final Function onTap;
  ProductTile({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    product.urlPicture,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        product.name,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ClepyColors.brandPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        product.description,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ClepyColors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.timelapse_rounded,
                            size: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'R\$:${product.rents.toStringAsFixed(2)} 000,00',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.refresh_circled,
                            size: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '${product.rents} Alugueis',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: RatingBar(
                  itemSize: 12,
                  ratingWidget: RatingWidget(
                    full: Icon(
                      Icons.star,
                      size: 8,
                      color: ClepyColors.brandPrimary,
                    ),
                    half: Icon(
                      Icons.star_half_outlined,
                      size: 8,
                      color: ClepyColors.brandLight,
                    ),
                    empty: Icon(
                      Icons.star_border,
                      size: 8,
                      color: ClepyColors.brandPrimary,
                    ),
                  ),
                  maxRating: 5,
                  initialRating: product.rating,
                  ignoreGestures: true,
                  onRatingUpdate: (rating) {},
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: ClepyColors.brandLight.withOpacity(0.2),
                blurRadius: 15.0,
                offset: const Offset(0.0, 0.75),
              )
            ],
          ),
        ),
      ),
    );
  }
}
