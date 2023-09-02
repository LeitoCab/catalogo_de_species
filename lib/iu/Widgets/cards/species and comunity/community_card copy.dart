// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../paginas/Views/Viewcomunidate.dart';

// ignore: must_be_immutable
class CommunitieCard extends StatelessWidget {
  final int index;
  final String titulo;
  final String subtitulo;
  final String subtitulo2;

  const CommunitieCard(
    this.index,
    this.titulo,
    this.subtitulo,
    this.subtitulo2, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewComunidate(index)))
        },
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Ink(
                    width: 62,
                    height: 62,
                    decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/indigenas.jpg'),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Wrap(direction: Axis.vertical, children: [
                  Text(titulo,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    subtitulo,
                  ),
                  Text(
                    subtitulo2,
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
