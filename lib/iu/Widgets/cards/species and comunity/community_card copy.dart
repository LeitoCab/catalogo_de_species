// ignore_for_file: file_names

import 'package:catalogo_species/iu/paginas/Views/Viewcomunidate.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommunitieCard extends StatelessWidget {
  final int index;
  final String titulo;

  final String latitud;
  final String longitud;
  final String? image;

  const CommunitieCard(
    this.index,
    this.titulo,
    this.latitud,
    this.longitud,
    this.image, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.5,
        child: InkWell(
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ViewComunidate(index, 'titulo', image, 'descripcion')))
          },
          child: SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Row(
                children: [
                  if (image == null)
                    const Icon(Icons.image_not_supported,
                        size: 62, color: Colors.orange)
                  else
                    Ink(
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
                      'Latitud: $latitud',
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'Longitud: $longitud',
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}
