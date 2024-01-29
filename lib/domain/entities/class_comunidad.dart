import 'dart:convert';

List<Community> communityFromJson(String str) =>
    List<Community>.from(json.decode(str).map((x) => Community.fromJson(x)));

String communityToJson(List<Community> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Community {
  final int idPuebloIndigena;
  final String vcNombre;
  final String teDescripcion;
  final double deLongitud;
  final double deLatitud;
  final String? vcImage;
  final String chEstado;
  final dynamic createdAt;
  final DateTime updatedAt;

  Community({
    required this.idPuebloIndigena,
    required this.vcNombre,
    required this.teDescripcion,
    required this.deLongitud,
    required this.deLatitud,
    required this.vcImage,
    required this.chEstado,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        idPuebloIndigena: json["id_pueblo_indigena"],
        vcNombre: json["vc_nombre"],
        teDescripcion: json["te_descripcion"],
        deLongitud: json["de_longitud"]?.toDouble(),
        deLatitud: json["de_latitud"]?.toDouble(),
        vcImage: json["vc_image"],
        chEstado: json["ch_estado"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_pueblo_indigena": idPuebloIndigena,
        "vc_nombre": vcNombre,
        "te_descripcion": teDescripcion,
        "de_longitud": deLongitud,
        "de_latitud": deLatitud,
        "vc_image": vcImage,
        "ch_estado": chEstado,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
