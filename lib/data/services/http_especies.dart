import 'package:http/http.dart' as http;
import '../../class/Class_especies.dart';

class EspeciesService {
  static Future<List<Species>> fetchSpecies() async {
    try {
      final response = await http
          .get(Uri.parse('http://api.amazonia.iiap.gob.pe/api/v1/species/'));

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
}
