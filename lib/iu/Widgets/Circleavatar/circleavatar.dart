import 'package:flutter/material.dart';

Widget categoriacircleAvatar(
    BuildContext context, String image, String texttitle) {
  return InkWell(
    borderRadius: BorderRadius.circular(10),
    onTap: () {},
    child: SizedBox(
      width: 80,
      height: 110,
      child: Wrap(
        runSpacing: 8,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.orange.withOpacity(0.5),
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(image),
            ),
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
    ),
  );
}
