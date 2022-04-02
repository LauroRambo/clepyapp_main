import 'package:flutter/material.dart';

import 'body.dart';

class Product_Details extends StatelessWidget {
  static String routeName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}