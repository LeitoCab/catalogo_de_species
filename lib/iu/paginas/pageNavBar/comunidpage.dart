import 'package:catalogo_species/iu/Widgets/cards/species%20and%20comunity/community_card%20copy.dart';
import 'package:catalogo_species/iu/buscador/search_comunidades_delegate.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/class_comunidad.dart';
import '../../../domain/services/http_comunidades.dart';
import '../../Widgets/Appbar.dart';

// ignore: camel_case_types
class comunidades extends StatefulWidget {
  const comunidades({
    super.key,
  });

  @override
  State<comunidades> createState() => _comunidadesState();
}

// ignore: camel_case_types
class _comunidadesState extends State<comunidades> {
  Future<List<Community>>? comunidades;

  @override
  void initState() {
    super.initState();
    comunidades = ComunidadService.fetchCommunity();
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
                  context: context, delegate: SearchComunidadesDelegate());
            },
            icon: const Icon(Icons.search_rounded)),
        null,
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
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CommunitieCard(
                          index = communityList[index].idPuebloIndigena,
                          communityList[index].vcNombre,
                          communityList[index].dtFechaCreacion.toString(),
                          communityList[index].chEstado));
                });
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
