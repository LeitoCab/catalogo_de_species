import 'package:catalogo_species/domain/services/http_comunidades.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/class_comunidad.dart';
import '../Widgets/cards/species and comunity/community_card copy.dart';

class SearchComunidadesDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.navigate_before));
  }

  @override
  Widget buildResults(BuildContext context) {
    ComunidadService comunidadService = ComunidadService();
    return FutureBuilder<List<Community>>(
      future: comunidadService.getCommunity(query: query),
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
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CommunitieCard(
                        communityList[index].idPuebloIndigena,
                        communityList[index].vcNombre,
                        communityList[index].createdAt.toString(),
                        communityList[index].chEstado));
              });
        } else {
          return const Center(
            child: Text('No hay datos'),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center();
  }
}
