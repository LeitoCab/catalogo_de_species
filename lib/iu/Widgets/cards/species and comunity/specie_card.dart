import 'package:flutter/material.dart';

// Asegúrate de importar correctamente el servicio

class CustomSpecieCommunitieCard extends StatelessWidget {
  final String image;
  final String titulo;
  final String subtitulo;
  final String tipo;
  const CustomSpecieCommunitieCard(
      this.image, this.titulo, this.subtitulo, this.tipo,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        onTap: () => {},
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Ink(
                  width: 62,
                  height: 62,
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
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
                    titulo,
                    style: const TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    tipo,
                    style: const TextStyle(
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
