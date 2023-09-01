import 'dart:convert';

ComunityId comunityIdFromJson(String str) =>
    ComunityId.fromJson(json.decode(str));

String comunityIdToJson(ComunityId data) => json.encode(data.toJson());

class ComunityId {
  final int idPuebloIndigena;
  final String vcNombre;
  final String teDescripcion;
  final int deLongitud;
  final int deLatitud;
  final dynamic vcImage;
  final DateTime dtFechaCreacion;
  final String chEstado;

  ComunityId({
    required this.idPuebloIndigena,
    required this.vcNombre,
    required this.teDescripcion,
    required this.deLongitud,
    required this.deLatitud,
    required this.vcImage,
    required this.dtFechaCreacion,
    required this.chEstado,
  });

  factory ComunityId.fromJson(Map<String, dynamic> json) => ComunityId(
        idPuebloIndigena: json["id_pueblo_indigena"],
        vcNombre: json["vc_nombre"],
        teDescripcion: json["te_descripcion"],
        deLongitud: json["de_longitud"],
        deLatitud: json["de_latitud"],
        vcImage: json["vc_image"],
        dtFechaCreacion: DateTime.parse(json["dt_fecha_creacion"]),
        chEstado: json["ch_estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_pueblo_indigena": idPuebloIndigena,
        "vc_nombre": vcNombre,
        "te_descripcion": teDescripcion,
        "de_longitud": deLongitud,
        "de_latitud": deLatitud,
        "vc_image": vcImage,
        "dt_fecha_creacion": dtFechaCreacion.toIso8601String(),
        "ch_estado": chEstado,
      };
}
