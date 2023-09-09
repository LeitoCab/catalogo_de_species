import 'package:http/http.dart' as http;

import '../entities/class_especies.dart';

class EspeciesService {
  // end point para obtener las especies;
  static Future<List<Species>> fetchSpecies() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.amazonia.iiap.gob.pe/api/v1/species'));

      if (response.statusCode == 200) {
        return speciesFromJson(response.body);
      } else {
        // Manejo de error si la respuesta no es exitosa (código de estado diferente de 200)

        throw Exception('Failed to load species');
      }
    } catch (e) {
      // Manejo de errores generales (por ejemplo, problemas de conexión)

      throw Exception('Failed to fetch species');
    }
  }

// end point para obtener las especies por nombre;
  List<Species> result = [];
  Future<List<Species>> getSpecies({String? query}) async {
    try {
      final response = await http
          .get(Uri.parse('https://api.amazonia.iiap.gob.pe/api/v1/species'));

      if (response.statusCode == 200) {
        result = speciesFromJson(response.body);

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
}
