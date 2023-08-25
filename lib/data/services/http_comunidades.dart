import 'package:catalogo_species/class/class_comunidad.dart';
import 'package:http/http.dart' as http;

class EspeciesService {
  static Future<List<Community>> fetchSpecies() async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.amazonia.iiap.gob.pe/api/v1/indigenous-community/'));

      if (response.statusCode == 200) {
        return communityFromJson(response.body);
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
