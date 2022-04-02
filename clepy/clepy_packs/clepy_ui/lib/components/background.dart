import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Widget widget;
  BackGround({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ClepyColors.brandLight.withOpacity(0.0),
            ClepyColors.brandLight.withOpacity(0.2),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.7, 0.9],
        ),
      ),
      child: widget,
    );
  }
}
