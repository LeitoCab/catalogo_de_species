import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entities/class_especiesid.dart';

class EspecieIdService {
  Future<SpeciesId> fetchSpeciesID() async {
    final response = await http
        .get(Uri.parse('https://api.amazonia.iiap.gob.pe/api/v1/species/1'));

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      return SpeciesId.fromJson(json.decode(response.body));
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
