import 'package:flutter/material.dart';
import 'package:app_clepy/models/Cart.dart';
import 'package:app_clepy/screens/confirm_rent/components/check_rent_card.dart';

import 'components/body.dart';

class ConfirmScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckRentCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Seu aluguél",
            style: TextStyle(color: Colors.black),
          ),
          /*Text(
            "${demoCarts.length} Alugueis",
            style: Theme.of(context).textTheme.caption,
          ),*/
        ],
      ),
    );
  }
}
