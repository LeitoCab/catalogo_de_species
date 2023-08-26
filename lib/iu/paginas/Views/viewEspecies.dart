// ignore_for_file: file_names

import 'package:catalogo_species/class/class_especiesid.dart';
import 'package:flutter/material.dart';

import '../../../data/services/http_especies_id.dart';
import '../../Widgets/appbar.dart';

class ViewEspecies extends StatefulWidget {
  const ViewEspecies({super.key});

  @override
  State<ViewEspecies> createState() => _ViewEspeciesState();
}

class _ViewEspeciesState extends State<ViewEspecies> {
  Future<SpeciesId>? especiesId;
  @override
  void initState() {
    super.initState();
    especiesId = EspecieIdService().fetchSpeciesID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarPrincipal(
            context,
            'Especies',
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.navigate_before_outlined)),
            null,
            null),
        body: Center(
          child: FutureBuilder<SpeciesId>(
            future: especiesId,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data!.vcImagen),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        width: double.infinity,
                        height: 250,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Positioned(
                                bottom: 7,
                                right: 65,
                                child: Material(
                                  borderRadius: BorderRadius.circular(9),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(9),
                                    onTap: () {},
                                    child: Ink(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                221, 251, 216, 1),
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child:
                                            const Icon(Icons.share_outlined)),
                                  ),
                                )),
                            Positioned(
                                bottom: 7,
                                right: 10,
                                child: Material(
                                  borderRadius: BorderRadius.circular(9),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(9),
                                    onTap: () {},
                                    child: Ink(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                221, 251, 216, 1),
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child: const Icon(
                                            Icons.file_download_outlined)),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        snapshot.data!.vcNombre,
                      ),
                      titleTextStyle: const TextStyle(
                        color: Color(0xFF6B5CC9),
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.27,
                      ),
                      subtitle: Text(snapshot.data!.vcNombreCientifico),
                      subtitleTextStyle: const TextStyle(
                        color: Color(0xFF201A1B),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.33,
                        letterSpacing: 0.50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Descripción de la especie',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF201A1B),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  height: 1.43,
                                  letterSpacing: 0.10,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                width: 266,
                                height: 2,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF201A1B)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView(
                          children: [Text(snapshot.data!.teDescripcion)],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}

/* Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: ShapeDecoration(
                    image: DecorationImage(
                        image: AssetImage('especies[index].imagen'),
                        fit: BoxFit.cover),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                width: double.infinity,
                height: 250,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Positioned(
                        bottom: 7,
                        right: 65,
                        child: Material(
                          borderRadius: BorderRadius.circular(9),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(9),
                            onTap: () {},
                            child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(221, 251, 216, 1),
                                    borderRadius: BorderRadius.circular(9)),
                                child: const Icon(Icons.share_outlined)),
                          ),
                        )),
                    Positioned(
                        bottom: 7,
                        right: 10,
                        child: Material(
                          borderRadius: BorderRadius.circular(9),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(9),
                            onTap: () {},
                            child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(221, 251, 216, 1),
                                    borderRadius: BorderRadius.circular(9)),
                                child:
                                    const Icon(Icons.file_download_outlined)),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'especies[index].titulo',
              ),
              titleTextStyle: const TextStyle(
                color: Color(0xFF6B5CC9),
                fontSize: 22,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 1.27,
              ),
              subtitle: Text('especies[index].subtitulo1'),
              subtitleTextStyle: const TextStyle(
                color: Color(0xFF201A1B),
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 1.33,
                letterSpacing: 0.50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ubicación y población',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF201A1B),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 1.43,
                          letterSpacing: 0.10,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 266,
                        height: 2,
                        decoration:
                            const BoxDecoration(color: Color(0xFF201A1B)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: const [
                    Text(
                        'Reconociendo que la libre circulación de información puede promover el desarrollo económico y social, la educación y el gobierno democrático.'),
                    Text(
                        'Observando los importantes avances que han tenido lugar en el desarrollo y la aplicación de la tecnología de la información y medios de telecomunicación.'),
                    Text(
                        'Expresando su preocupación por el hecho de que los avances tecnológicos han abierto nuevas posibilidades de actividades delictivas, en particular la utilización de la tecnología de la información con fines delictivos.'),
                    Text(
                        'Observando la necesidad de prevenir la utilización de la tecnología de la información con fines delictivos.'),
                    Text(
                        'Reconociendo la necesidad de que los Estados y el sector privado cooperen para luchar contra la utilización de la tecnología de la información con fines delictivos.'),
                    Text(
                        'Subrayando la necesidad de fomentar la coordinación y la cooperación entre los Estados en la lucha contra la utilización de la tecnología de la información con fines delictivos y, en ese contexto, haciendo hincapié en la función que pueden desempeñar las Naciones Unidas y otras organizaciones internacionales y regionales.')
                  ],
                ),
              ),
            ),
          ],
        ) */