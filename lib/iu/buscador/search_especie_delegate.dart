import 'package:flutter/material.dart';
import '../../domain/entities/class_especies.dart';
import '../../domain/services/http_especies.dart';
import '../Widgets/cards/species and comunity/specie_card.dart';

class SearchEspecieDelegate extends SearchDelegate {
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
    EspeciesService speciesservices = EspeciesService();

    return FutureBuilder<List<Species>>(
        future: speciesservices.getSpecies(query: query),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data != null) {
            List<Species> speciesList = snapshot.data!;
            return ListView.builder(
                itemCount: speciesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomSpecieCommunitieCard(
                        speciesList[index].vcImagen,
                        speciesList[index].vcNombre,
                        speciesList[index].vcNombreCientifico,
                        speciesList[index].tipo),
                  );
                });
          } else {
            return const Center(
              child: Text("No hay datos"),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center();
  }
}
