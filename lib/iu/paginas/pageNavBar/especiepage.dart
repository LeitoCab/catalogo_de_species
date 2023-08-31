import 'package:flutter/material.dart';
import '../../../domain/entities/class_especies.dart';
import '../../../domain/services/http_especies.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/cards/species and comunity/specie_card.dart';
import '../../buscador/search_especie_delegate.dart';
import '../../colores/custom_icons.dart';

//import '../../Widgets/Appbar.dart';

class Especies extends StatefulWidget {
  const Especies({super.key});

  @override
  State<Especies> createState() => _EspeciesState();
}

class _EspeciesState extends State<Especies>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late Future<List<Species>> especies;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    especies = EspeciesService.fetchSpecies();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBarPrincipal(
          context,
          'Especies',
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchEspecieDelegate());
              },
              icon: const Icon(Icons.search_rounded)),
          TabBar(controller: _tabController, isScrollable: true, tabs: const [
            Tab(
              icon: Icon(CustomIcons.bird),
              text: 'Aves',
            ),
            Tab(
              icon: Icon(CustomIcons.fish),
              text: 'Peces',
            ),
            Tab(
              icon: Icon(CustomIcons.mammal),
              text: 'Mamíferos',
            ),
            Tab(
              icon: Icon(CustomIcons.reptile),
              text: 'Reptiles',
            ),
            Tab(icon: Icon(CustomIcons.palm), text: 'Palmeras'),
            Tab(icon: Icon(CustomIcons.tree), text: 'Arboles'),
            Tab(icon: Icon(CustomIcons.insect), text: 'Insectos'),
          ]),
          null),
      body: FutureBuilder<List<Species>>(
          future: especies,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData && snapshot.data != null) {
              List<Species> speciesListAves = snapshot.data!.where((element) {
                return element.tipo == 'Aves';
              }).toList();
              List<Species> speciesListPeces = snapshot.data!.where((element) {
                return element.tipo == 'Peces';
              }).toList();
              List<Species> speciesListMamiferos =
                  snapshot.data!.where((element) {
                return element.tipo == 'Mamiferos';
              }).toList();
              List<Species> speciesListReptiles =
                  snapshot.data!.where((element) {
                return element.tipo == 'Reptiles';
              }).toList();
              List<Species> speciesListPlantas =
                  snapshot.data!.where((element) {
                return element.tipo == 'Palmeras';
              }).toList();
              List<Species> speciesListArboles =
                  snapshot.data!.where((element) {
                return element.tipo == 'Arboles';
              }).toList();
              List<Species> speciesListInsectos =
                  snapshot.data!.where((element) {
                return element.tipo == 'Insectos';
              }).toList();
              return TabBarView(controller: _tabController, children: [
                ListView.builder(
                    itemCount: speciesListAves.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomSpecieCommunitieCard(
                          speciesListAves[index].vcImagen,
                          speciesListAves[index].vcNombre,
                          speciesListAves[index].vcNombreCientifico,
                          speciesListAves[index].tipo,
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: speciesListPeces.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomSpecieCommunitieCard(
                            speciesListPeces[index].vcImagen,
                            speciesListPeces[index].vcNombre,
                            speciesListPeces[index].vcNombreCientifico,
                            speciesListPeces[index].tipo),
                      );
                    }),
                ListView.builder(
                    itemCount: speciesListMamiferos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomSpecieCommunitieCard(
                            speciesListMamiferos[index].vcImagen,
                            speciesListMamiferos[index].vcNombre,
                            speciesListMamiferos[index].vcNombreCientifico,
                            speciesListMamiferos[index].tipo),
                      );
                    }),
                ListView.builder(
                    itemCount: speciesListReptiles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomSpecieCommunitieCard(
                            speciesListReptiles[index].vcImagen,
                            speciesListReptiles[index].vcNombre,
                            speciesListReptiles[index].vcNombreCientifico,
                            speciesListReptiles[index].tipo),
                      );
                    }),
                ListView.builder(
                    itemCount: speciesListPlantas.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomSpecieCommunitieCard(
                            speciesListPlantas[index].vcImagen,
                            speciesListPlantas[index].vcNombre,
                            speciesListPlantas[index].vcNombreCientifico,
                            speciesListPlantas[index].tipo),
                      );
                    }),
                ListView.builder(
                    itemCount: speciesListArboles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomSpecieCommunitieCard(
                            speciesListArboles[index].vcImagen,
                            speciesListArboles[index].vcNombre,
                            speciesListArboles[index].vcNombreCientifico,
                            speciesListArboles[index].tipo),
                      );
                    }),
                ListView.builder(
                    itemCount: speciesListInsectos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomSpecieCommunitieCard(
                            speciesListInsectos[index].vcImagen,
                            speciesListInsectos[index].vcNombre,
                            speciesListInsectos[index].vcNombreCientifico,
                            speciesListInsectos[index].tipo),
                      );
                    }),
              ]);
            } else {
              return const Center(
                child: Text("No hay datos"),
              );
            }
          }),
    );
  }
}
