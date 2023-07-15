// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget AppBarPrincipal(
    // ignore: non_constant_identifier_names
    BuildContext context,
    String title,
    // ignore: non_constant_identifier_names
    Iconss,
    shear) {
  return AppBar(
    title: title != ' ' ? Text(title) : null,
    titleTextStyle: const TextStyle(
      color: Color(0xFF201A1B),
      fontSize: 22,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Iconss ?? Iconss),
    ),
    actions: [
      IconButton(
        style: const ButtonStyle(
          iconSize: MaterialStatePropertyAll(30),
        ),
        onPressed: () {},
        icon: Icon(shear ?? shear),
      ),
    ],
  );
}
