import 'package:clepy_feed/clepy_feed.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClepyDrawer(
        body: BackGround(
          widget: HomeFeedScreen(),
        ),
      ),
    );
  }
}
