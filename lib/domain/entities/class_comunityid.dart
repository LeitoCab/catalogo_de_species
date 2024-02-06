import 'dart:convert';

ComunityId comunityIdFromJson(String str) =>
    ComunityId.fromJson(json.decode(str));

String comunityIdToJson(ComunityId data) => json.encode(data.toJson());

class ComunityId {
  final int idPuebloIndigena;
  final String vcNombre;
  final String teDescripcion;
  final String? vcImage;
  final String chEstado;
  final dynamic createdAt;
  final DateTime updatedAt;

  ComunityId({
    required this.idPuebloIndigena,
    required this.vcNombre,
    required this.teDescripcion,
    required this.vcImage,
    required this.chEstado,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ComunityId.fromJson(Map<String, dynamic> json) => ComunityId(
        idPuebloIndigena: json["id_pueblo_indigena"],
        vcNombre: json["vc_nombre"],
        teDescripcion: json["te_descripcion"],
        vcImage: json["vc_image"],
        chEstado: json["ch_estado"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_pueblo_indigena": idPuebloIndigena,
        "vc_nombre": vcNombre,
        "te_descripcion": teDescripcion,
        "vc_image": vcImage,
        "ch_estado": chEstado,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
