import 'package:flutter/material.dart';

class HorizontalLargeCTA extends StatelessWidget {
  final String urlImage;
  final String route;
  final String idObject;

  const HorizontalLargeCTA({
    Key? key,
    required this.idObject,
    required this.route,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            route,
            arguments: {
              'uidRoute': idObject,
            },
          );
        },
        child: SizedBox(
          height: 130,
          width: MediaQuery.of(context).size.width - 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              urlImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
