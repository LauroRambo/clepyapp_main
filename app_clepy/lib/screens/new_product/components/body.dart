import 'package:flutter/material.dart';
import 'package:app_clepy/constants.dart';
import 'package:app_clepy/screens/new_product/components/complete_product.dart';
import 'package:app_clepy/size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Completar Cadastro", style: headingStyle),
                Text(
                  "Complete os dados do seu equipamento",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProductForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "Ao continuar você confirma que concorda \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
