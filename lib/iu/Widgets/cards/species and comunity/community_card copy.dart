// ignore_for_file: file_names

import 'package:catalogo_species/iu/paginas/Views/Viewcomunidate.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommunitieCard extends StatelessWidget {
  final int index;
  final String titulo;
  final String subtitulo;
  final String subtitulo2;
  final String? image;

  const CommunitieCard(
    this.index,
    this.titulo,
    this.subtitulo,
    this.subtitulo2, {
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    print('subtitulo2: $subtitulo2');
    print('image: $image');
    return Card(
      elevation: 0.5,
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewComunidate(index)))
        },
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              children: [
                if (image == null)
                  const Text('No hay imagen')
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Ink(
                      width: 62,
                      height: 62,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(image!),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
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
                    style: const TextStyle(
                      fontSize: 7,
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
