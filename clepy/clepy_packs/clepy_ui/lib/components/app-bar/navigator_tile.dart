import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/cupertino.dart';

Widget NavigatorTile(
        {required String route,
        required BuildContext context,
        required IconData icon,
        required String text}) =>
    SizedBox(
      height: 50,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: ClepyColors.ice,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(color: ClepyColors.ice),
            )
          ],
        ),
      ),
    );
