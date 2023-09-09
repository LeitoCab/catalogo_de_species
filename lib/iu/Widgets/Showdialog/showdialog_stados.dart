import 'package:catalogo_species/domain/entities/class_especies_conservacion.dart';
import 'package:flutter/material.dart';

import '../../../domain/services/http_stados_conservacion.dart';

class ShowdialogStados extends StatefulWidget {
  const ShowdialogStados({super.key});

  @override
  State<ShowdialogStados> createState() => _ShowdialogStadosState();
}

class _ShowdialogStadosState extends State<ShowdialogStados> {
  late Future<List<EstadosConservacion>> estadosConservacion;
  @override
  void initState() {
    super.initState();
    estadosConservacion = EstadosconservacionService.fetchStadosconservacion();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Sobre los estados de conservación',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
          height: double.infinity,
          width: double.maxFinite,
          child: FutureBuilder(
              future: estadosConservacion,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  List<EstadosConservacion> speciesPorEstado1 =
                      snapshot.data!.where((element) {
                    return element.vcInstitucion.isNotEmpty;
                  }).toList();
                  List<EstadosConservacion> speciesPorEstado2 =
                      snapshot.data!.where((element) {
                    return element.vcInstitucion.isEmpty;
                  }).toList();
                  return ListView(
                    children: [
                      const Text(
                        'Se presenta el estado de conservación a nivel mundial como a nivel regional. Este dato se presenta de manera visual al pie de cada ilustración, tomando como referencia los siguientes documentos.',
                        textAlign: TextAlign.justify,
                      ),
                      const ListTile(
                        title: Text('Decreto Supremo Nº 004-2014-MINAGRI',
                            textAlign: TextAlign.justify),
                        subtitle: Text(
                            'En el que se aprueba y actualiza la categorización de especies amenazadas de fauna silvestre a nivel nacional, siguiendo los criterios y categorías de la UICN a nivel mundial.',
                            textAlign: TextAlign.justify),
                      ),
                      const ListTile(
                        title: Text('Decreto Supremo Nº 043-2006-AG',
                            textAlign: TextAlign.justify),
                        subtitle: Text(
                            'En el que se aprueba la categorización de especies amenazadas de flora silvestre a nivel nacional, siguiendo los criterios y categorías de la UICN a nivel mundial.',
                            textAlign: TextAlign.justify),
                      ),
                      const ListTile(
                        title: Text(
                            'Lista Roja de Especies Amenazadas de la Unión Mundial para la Naturaleza-UICN',
                            textAlign: TextAlign.justify),
                        subtitle: Text(
                            'En la que se presenta el estado de conservación de las especies amenazadas de flora y fauna silvestre a nivel mundial.',
                            textAlign: TextAlign.justify),
                      ),
                      Wrap(
                        spacing: 2,
                        children: speciesPorEstado1.map((e) {
                          return ListTile(
                            leading: SizedBox(
                              height: 35,
                              width: 35,
                              child: Image.network(
                                e.vcImagenEstado,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(e.vcNombre),
                          );
                        }).toList(),
                      ),
                      const ListTile(
                        title: Text(
                            'Convención sobre el Comercio Internacional de Especies Amenazadas de Fauna y Flora Silvestres-CITES',
                            textAlign: TextAlign.justify),
                        subtitle: Text(
                            'Acuerdo internacional que tiene como finalidad velar para que el comercio internacional de especímenes de flora y fauna no constituya una amenaza para su supervivencia. La CITES incluye a las diferentes especies de flora y fauna en tres apéndices, según el grado de protección que necesiten:',
                            textAlign: TextAlign.justify),
                      ),
                      Wrap(
                        spacing: 2,
                        children: speciesPorEstado2.map((e) {
                          return ListTile(
                            leading: SizedBox(
                              height: 35,
                              width: 35,
                              child: Image.network(
                                e.vcImagenEstado,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(e.vcNombre),
                          );
                        }).toList(),
                      )
                    ],
                  );
                }
                return const Center(
                  child: Text('No hay datos'),
                );
              })),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
