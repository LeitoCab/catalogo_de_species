import 'package:http/http.dart' as http;
import '../entities/class_especies_conservacion.dart';

class EstadosconservacionService {
  static Future<List<EstadosConservacion>> fetchStadosconservacion() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.amazonia.iiap.gob.pe/api/v1/species/est_conservacion'));

      if (response.statusCode == 200) {
        return EstadosConservacionFromJson(response.body);
      } else {
        // Manejo de error si la respuesta no es exitosa (código de estado diferente de 200)

        throw Exception('Failed to load estadosconservacion');
      }
    } catch (e) {
      // Manejo de errores generales (por ejemplo, problemas de conexión)

      throw Exception('Failed to fetch estadosconservacion');
    }
  }
}
