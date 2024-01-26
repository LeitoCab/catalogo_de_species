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
    _tabController = TabController(length: 7, vsync: this);
    // especies = EspeciesService.especies(type: 1);
    // _tabController = TabController(length: 7, vsync: this);

    // Configura el controlador para ejecutar la función _cargarEspecies al tocar una pestaña
    _tabController.addListener(_cargarEspecies);

    // Carga las especies iniciales
    _cargarEspecies();
  }

// Función para cargar las especies según la pestaña seleccionada
  void _cargarEspecies() {
    // Obtén el tipo de especies según la pestaña actual
    int typeId = _tabController.index + 1;

    // Actualiza la variable 'especies' con las especies correspondientes
    setState(() {
      especies = EspeciesService.especies(type: typeId);
    });
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
      ),
      body: FutureBuilder<List<Species>>(
          future: especies,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData && snapshot.data != null) {
              return TabBarView(controller: _tabController, children: [
                ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final specie = snapshot.data?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: CustomSpecieCommunitieCard(
                          specie!.idEspecie,
                          specie.vcImagen,
                          specie.vcNombre,
                          specie.vcNombreCientifico,
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final specie = snapshot.data?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: CustomSpecieCommunitieCard(
                          specie!.idEspecie,
                          specie.vcImagen,
                          specie.vcNombre,
                          specie.vcNombreCientifico,
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final specie = snapshot.data?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: CustomSpecieCommunitieCard(
                          specie!.idEspecie,
                          specie.vcImagen,
                          specie.vcNombre,
                          specie.vcNombreCientifico,
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final specie = snapshot.data?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: CustomSpecieCommunitieCard(
                          specie!.idEspecie,
                          specie.vcImagen,
                          specie.vcNombre,
                          specie.vcNombreCientifico,
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final specie = snapshot.data?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: CustomSpecieCommunitieCard(
                          specie!.idEspecie,
                          specie.vcImagen,
                          specie.vcNombre,
                          specie.vcNombreCientifico,
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final specie = snapshot.data?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: CustomSpecieCommunitieCard(
                          specie!.idEspecie,
                          specie.vcImagen,
                          specie.vcNombre,
                          specie.vcNombreCientifico,
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final specie = snapshot.data?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: CustomSpecieCommunitieCard(
                          specie!.idEspecie,
                          specie.vcImagen,
                          specie.vcNombre,
                          specie.vcNombreCientifico,
                        ),
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

/*import 'package:catalogo_species/domain/services/http_especies.dart';
import 'package:flutter/material.dart';

class Especies extends StatelessWidget {
  const Especies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Especies'),
      ),
      body: FutureBuilder(
        future: EspeciesService.especies(type: 4),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final specie = snapshot.data?[index];
                return ListTile(
                  title: Text(specie?.vcNombre ?? ''),
                  subtitle: Text(specie?.vcNombreCientifico ?? ''),
                  leading: Image.network(specie?.vcImagen ?? ''),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}*/
