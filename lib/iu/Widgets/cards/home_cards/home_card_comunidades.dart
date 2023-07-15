import 'package:flutter/material.dart';

Widget comunidadesCard(BuildContext context, String image, String texttitle) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //color: const Color.fromARGB(255, 214, 169, 169),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: SizedBox(
        width: 350,
        height: 218,
        child: Column(
          children: <Widget>[
            Ink(
              width: 350,
              height: 182,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.amber,
              ),
              child: Image.asset(image),
            ),
            Ink(
              width: 350,
              height: 38,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  texttitle,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
