import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Community> communityFromJson(String str) =>
    List<Community>.from(json.decode(str).map((x) => Community.fromJson(x)));

String communityToJson(List<Community> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Community extends Equatable {
  final int idPuebloIndigena;
  final String vcNombre;
  final String teDescripcion;
  final int deLongitud;
  final int deLatitud;
  final dynamic vcImage;
  final DateTime dtFechaCreacion;
  final String chEstado;

  const Community({
    required this.idPuebloIndigena,
    required this.vcNombre,
    required this.teDescripcion,
    required this.deLongitud,
    required this.deLatitud,
    required this.vcImage,
    required this.dtFechaCreacion,
    required this.chEstado,
  });

  factory Community.fromJson(Map<String, dynamic> json) => Community(
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

  @override
  List<Object?> get props => [
        idPuebloIndigena,
        vcNombre,
        teDescripcion,
        deLongitud,
        deLatitud,
        vcImage,
        dtFechaCreacion,
        chEstado,
      ];
  @override
  bool get stringify => true;
}
