import 'package:catalogo_species/classcomunity.dart';
import 'package:flutter/material.dart';

class SearchEspecieDelegate extends SearchDelegate<Especiess> {
  final List<Especiess> especies;
  List<Especiess> _filter = [];
  SearchEspecieDelegate(this.especies);
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
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return const Center();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = especies.where((especies) {
      return especies.titulo.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return const Center();
      },
    );
  }
}
