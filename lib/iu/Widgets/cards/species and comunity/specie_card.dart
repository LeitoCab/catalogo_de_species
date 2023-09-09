import 'package:catalogo_species/iu/paginas/Views/viewEspecies.dart';
import 'package:flutter/material.dart';

// Asegúrate de importar correctamente el servicio

class CustomSpecieCommunitieCard extends StatelessWidget {
  final int index;
  final String image;
  final String titulo;
  final String subtitulo;

  const CustomSpecieCommunitieCard(
      this.index, this.image, this.titulo, this.subtitulo,
      {Key? key})
      : super(key: key);

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
              builder: (context) => ViewEspecies(index),
            ),
          )
        },
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Ink(
                    width: 62,
                    height: 62,
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.fill),
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Wrap(direction: Axis.vertical, children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Text(
                    subtitulo,
                  ),
                  const Text(
                    '',
                    style: TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
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
