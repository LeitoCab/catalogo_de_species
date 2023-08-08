import 'package:flutter/material.dart';

import '../../../paginas/Views/Viewcomunidate.dart';

class CommunitieCard extends StatelessWidget {
  final int index;
  CommunitieCard(this.index);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewComunidate(index)))
        },
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Ink(
                  width: 62,
                  height: 62,
                  decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/especie.png'),
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
                    'titulo $index',
                    style: const TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Text(
                    'subtitulo $index',
                    style: const TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'subtitulo $index',
                    style: const TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'subtitulo $index',
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
}
