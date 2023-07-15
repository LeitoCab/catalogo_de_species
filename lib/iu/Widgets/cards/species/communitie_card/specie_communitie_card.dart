import 'package:flutter/material.dart';

Widget customSpecieCommunitieCard(
  BuildContext context,
  String image,
  String title,
  String subtitle1,
  String subtitle2,
  String subtitle3,
) {
  return Card(
    elevation: 0,
    color: const Color.fromRGBO(255, 255, 255, 1),
    child: InkWell(
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(15),
      onTap: () => {},
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Ink(
                width: 62,
                height: 62,
                decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          image != '' ? image : 'assets/especie.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.orange),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              Wrap(direction: Axis.vertical, children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF201A1B),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
                Text(
                  subtitle1,
                  style: const TextStyle(
                    color: Color(0xFF201A1B),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subtitle2,
                  style: const TextStyle(
                    color: Color(0xFF201A1B),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subtitle3,
                  style: const TextStyle(
                    color: Color(0xFF201A1B),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    ),
  );
}
