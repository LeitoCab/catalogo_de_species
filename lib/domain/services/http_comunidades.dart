import 'package:http/http.dart' as http;
import '../entities/class_comunidad.dart';

class ComunidadService {
  static Future<List<Community>> fetchCommunity() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.amazonia.iiap.gob.pe/api/v1/indigenous-community'));

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
}
