// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../domain/entities/class_especiesid.dart';
import '../../../domain/services/http_especies_id.dart';
import '../../Widgets/appbar.dart';

class ViewEspecies extends StatefulWidget {
  final int index;
  const ViewEspecies(this.index, {super.key});

  @override
  State<ViewEspecies> createState() => _ViewEspeciesState();
}

class _ViewEspeciesState extends State<ViewEspecies> {
  Future<SpeciesId>? especiesId;
  int get index => widget.index;
  @override
  void initState() {
    super.initState();
    especiesId = EspecieIdService().fetchSpeciesID(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarPrincipal(
            context,
            'Vista de la Especie',
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.navigate_before_outlined)),
            null),
        body: FutureBuilder<SpeciesId>(
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
                          color: Colors.white,
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
                      style: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 1.27,
                      ),
                    ),
                    subtitle: Text(snapshot.data!.vcNombreCientifico),
                    subtitleTextStyle: const TextStyle(
                      fontSize: 14,
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
                        children: [
                          Text(
                            snapshot.data!.teDescripcion.trim(),
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              height: 1.27,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
