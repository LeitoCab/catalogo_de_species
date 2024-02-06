import 'package:catalogo_species/iu/buscador/search_comunidades_delegate.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/class_comunidad.dart';
import '../../../domain/services/http_comunidades.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/cards/species and comunity/community_card copy.dart';

// ignore: camel_case_types
class comunidades extends StatefulWidget {
  const comunidades({
    super.key,
  });

  @override
  State<comunidades> createState() => _ComunidadesState();
}

// ignore: camel_case_types
class _ComunidadesState extends State<comunidades> {
  Future<List<Community>>? comunidades;

  @override
  void initState() {
    super.initState();
    comunidades = ComunidadService.fetchCommunity(type: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrincipal(
        context,
        'Comunidades',
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: SearchComunidadesDelegate(),
            );
          },
          icon: const Icon(Icons.search_rounded),
        ),
        null,
      ),
      body: FutureBuilder<List<Community>>(
        future: comunidades,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            List<Community> communityList = snapshot.data!;
            return ListView.builder(
              itemCount: communityList.length,
              itemBuilder: (context, index) {
                final Community community = communityList[index];

                // Verificar si hay una imagen válida

                return SizedBox(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CommunitieCard(
                          community.idPuebloIndigena,
                          community.vcNombre,
                          community.deLatitud.toString(),
                          community.deLongitud.toString(),
                          community.vcImage)),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No hay datos'),
            );
          }
        },
      ),
    );
  }
}
