import 'package:catalogo_species/classcomunity.dart';
import 'package:flutter/material.dart';

import '../../../paginas/Views/Viewcomunidate.dart';

// ignore: must_be_immutable
class CommunitieCard extends StatelessWidget {
  final int index;
  final List<Comunidades> titulos = [
    Comunidades('assets/c1.png', 'Comunidad Nativa 1', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c2.png', 'Comunidad Nativa 2', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c3.jpeg', 'Tupis', 'America de Sur',
        'idioma tupi-guarani', 'legado cultural'),
    Comunidades('assets/c1.png', 'Comunidad Nativa 1', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c2.png', 'Comunidad Nativa 2', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c3.jpeg', 'Tupis', 'America de Sur',
        'idioma tupi-guarani', 'legado cultural'),
    Comunidades('assets/c1.png', 'Comunidad Nativa 1', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c2.png', 'Comunidad Nativa 2', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c3.jpeg', 'Tupis', 'America de Sur',
        'idioma tupi-guarani', 'legado cultural'),
    Comunidades('assets/c1.png', 'Comunidad Nativa 1', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c2.png', 'Comunidad Nativa 2', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c3.jpeg', 'Tupis', 'America de Sur',
        'idioma tupi-guarani', 'legado cultural'),
    Comunidades('assets/c1.png', 'Comunidad Nativa 1', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c2.png', 'Comunidad Nativa 2', 'America de Sur',
        'Descendencia Amazonica', 'legado cultural'),
    Comunidades('assets/c3.jpeg', 'Tupis', 'America de Sur',
        'idioma tupi-guarani', 'legado cultural'),
  ];
  CommunitieCard(
    this.index, {
    super.key,
  });
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
                      image: DecorationImage(
                        image: AssetImage(titulos[index].imagen),
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
                    titulos[index].titulo,
                    style: const TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Text(
                    titulos[index].subtitulo1,
                    style: const TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    titulos[index].subtitulo2,
                    style: const TextStyle(
                      color: Color(0xFF201A1B),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    titulos[index].subtitulo3,
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
