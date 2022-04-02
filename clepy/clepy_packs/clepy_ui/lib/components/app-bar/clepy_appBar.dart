import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ClepyAppBar = Container(
  height: 30,
  padding: const EdgeInsets.symmetric(horizontal: 5),
  decoration: BoxDecoration(
    color: Colors.white30,
    borderRadius: BorderRadius.circular(30),
  ),
  child: Row(
    children: [
      const Icon(
        Icons.search,
        color: Colors.blueGrey,
      ),
      Flexible(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Encontre seu próximo clepy!",
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      )
    ],
  ),
);

Widget ClepyAppBarLogo = Image.asset(
  'assets/imagens/logo-horizontal.png',
  fit: BoxFit.fitHeight,
  height: 30,
);
