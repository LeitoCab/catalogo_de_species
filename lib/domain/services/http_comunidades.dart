import 'dart:convert';

import 'package:catalogo_species/domain/entities/class_comunityid.dart';
import 'package:http/http.dart' as http;
import '../entities/class_comunidad.dart';

class ComunidadService {
  // Endpoint para obtener todas las comunidades
  static Future<List<Community>> fetchCommunity({required int type}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.amazonia.iiap.gob.pe/api/v1/indigenous-community/1/16'));

      if (response.statusCode == 200) {
        Map<String, dynamic> result = json.decode(response.body);
        final List<dynamic> speciesList = result['pueblosIndigenas'];
        final value =
            List<Community>.from(speciesList.map((x) => Community.fromJson(x)));
        return value;
      } else {
        // Manejo de error si la respuesta no es exitosa (código de estado diferente de 200)
        throw Exception('Fallo al cargar comunidades');
      }
    } catch (e) {
      // Manejo de errores generales (por ejemplo, problemas de conexión)
      throw Exception('Failed to fetch species');
    }
  }

  // Endpoint para obtener todas las comunidades con un query y filtrar por nombre
  List<Community> result = [];
  Future<List<Community>> getCommunity({String? query}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.amazonia.iiap.gob.pe/api/v1/indigenous-community'));

      if (response.statusCode == 200) {
        result = communityFromJson(response.body);

        if (query != null) {
          result = result
              .where((element) =>
                  element.vcNombre.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      } else {
        // Manejo de error si la respuesta no es exitosa (código de estado diferente de 200)
        throw Exception('Failed to load species');
      }
    } catch (e) {
      // Manejo de errores generales (por ejemplo, problemas de conexión)
      throw Exception('No se pudo cargar las especies');
    }
    return result;
  }

  // Endpoint para obtener una comunidad por su id
  static Future<ComunityId> fetchCommunityID(int index) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.amazonia.iiap.gob.pe/api/v1/indigenous-community/$index'));

      if (response.statusCode == 200) {
        return comunityIdFromJson(response.body);
      } else {
        // Manejo de error si la respuesta no es exitosa (código de estado diferente de 200)
        throw Exception('Failed to load species');
      }
    } catch (e) {
      // Manejo de errores generales (por ejemplo, problemas de conexión)
      throw Exception('Failed to fetch species');
    }
  }
}
