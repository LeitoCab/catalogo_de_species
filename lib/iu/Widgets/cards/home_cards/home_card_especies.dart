import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget cardSpecies() {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.black)),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => {},
      child: SizedBox(
        width: 163.5,
        height: 262,
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/especie.png',
            ),
          ],
        ),
      ),
    ),
  );
}
