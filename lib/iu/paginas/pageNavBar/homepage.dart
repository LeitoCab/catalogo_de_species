import 'package:catalogo_species/iu/Widgets/Showdialog/showdialog_stados.dart';
import 'package:catalogo_species/iu/Widgets/cards/home_cards/home_card_comunidades.dart';
import 'package:catalogo_species/iu/Widgets/circleAvatar/circleAvatar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/class_especies.dart';
import '../../../domain/services/http_especies.dart';
import '../../Widgets/drawer/Drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Species>> especies;
  @override
  void initState() {
    super.initState();
    especies = EspeciesService.fetchSpecies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Amazonia'),
        ),
        drawer: const drawer(),
        body: FutureBuilder<List<Species>>(
            future: especies,
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.hasData) {
                List<Species> speciesPorEstado =
                    snapshot.data!.where((element) {
                  return element.vcImagen.isNotEmpty;
                }).toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'categorias',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          categoriacircleAvatar(
                              context, 'assets/aves.png', 'Aves'),
                          categoriacircleAvatar(
                              context, 'assets/mamifero.png', 'Mamiferos'),
                          categoriacircleAvatar(
                              context, 'assets/reptil.png', 'Reptiles'),
                          categoriacircleAvatar(
                              context, 'assets/anfibio.png', 'Anfibios')
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    ListTile(
                      title: const Text(
                        'Especies por estado de conservación',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      trailing: IconButton(
                          tooltip: 'Ayuda',
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const ShowdialogStados();
                                });
                          },
                          icon: const Icon(Icons.help_outline_outlined)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CarouselSlider.builder(
                          itemCount: speciesPorEstado.length,
                          options: CarouselOptions(
                            height: double.infinity,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 4),
                          ),
                          itemBuilder: (_, index, realIndex) {
                            return ComunidadesCard(
                              'speciesPorEstado[index].vcImagen',
                              speciesPorEstado[index].vcNombre,
                              speciesPorEstado[index].vcNombreCientifico,
                              'speciesPorEstado[index].estado',
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(child: Text('No hay datos'));
            }));
  }
}
