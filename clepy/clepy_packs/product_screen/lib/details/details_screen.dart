import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'components/size_config.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const CustomAppBar(),
      ),
      body: Body(),
    );
  }
}