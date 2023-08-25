import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Species> speciesFromJson(String str) =>
    List<Species>.from(json.decode(str).map((x) => Species.fromJson(x)));

String speciesToJson(List<Species> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Species extends Equatable {
  final int idEspecie;
  final String vcNombre;
  final String vcNombreCientifico;
  final String tipo;
  final String vcImagen;
  final dynamic vcSonido;

  final List<dynamic> vcImagenesEstado;

  const Species({
    required this.idEspecie,
    required this.vcNombre,
    required this.vcNombreCientifico,
    required this.tipo,
    required this.vcImagen,
    required this.vcSonido,
    required this.vcImagenesEstado,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        idEspecie: json["id_especie"],
        vcNombre: json["vc_nombre"],
        vcNombreCientifico: json["vc_nombre_cientifico"],
        tipo: json["tipo"],
        vcImagen: json["vc_imagen"],
        vcSonido: json["vc_sonido"],
        vcImagenesEstado:
            List<dynamic>.from(json["vc_imagenes_estado"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id_especie": idEspecie,
        "vc_nombre": vcNombre,
        "vc_nombre_cientifico": vcNombreCientifico,
        "tipo": tipo,
        "vc_imagen": vcImagen,
        "vc_sonido": vcSonido,
        "vc_imagenes_estado":
            List<dynamic>.from(vcImagenesEstado.map((x) => x)),
      };

  @override
  List<Object?> get props => [
        idEspecie,
        vcNombre,
        vcNombreCientifico,
        vcImagen,
        vcSonido,
        vcImagenesEstado
      ];

  @override
  bool get stringify => true;
}
