import 'package:app_clepy/theme.dart';
import 'package:clepy_app/clepy_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Clepy());
}

class Clepy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clepy',
      theme: theme(),
      initialRoute: 'splash',
      onGenerateRoute: Routes.launchRoutes,
    );
  }
}
