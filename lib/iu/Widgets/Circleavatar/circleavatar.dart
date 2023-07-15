import 'package:flutter/material.dart';

Widget categoriacircleAvatar(
    BuildContext context, String image, String texttitle) {
  return SizedBox(
    width: 80,
    height: 110,
    child: Wrap(
      runSpacing: 8,
      children: [
        CircleAvatar(
          radius: 40,
          //backgroundColor: Colors.white,
          backgroundImage: AssetImage(image),
        ),
        Center(
          child: Text(
            texttitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}
