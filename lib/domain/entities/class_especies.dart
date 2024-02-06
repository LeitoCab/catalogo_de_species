// To parse this JSON data, do
//
//     final species = speciesFromJson(jsonString);

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
  final String vcImagen;
  final Taxa taxa;
  /* final String vcAno;
  final int idFamilia;
  final dynamic vcSonido;
  final List<dynamic> estadosConservacion;
  final DateTime fechaCreacion;
  final DateTime fechaModificacion;
  final String estado; */

  const Species({
    required this.idEspecie,
    required this.vcNombre,
    required this.vcNombreCientifico,
    required this.vcImagen,
    required this.taxa,
    /* required this.vcAno,
    required this.idFamilia,
    required this.vcSonido,
    required this.estadosConservacion,
    required this.fechaCreacion,
    required this.fechaModificacion,
    required this.estado, */
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        idEspecie: json["id_especie"],
        vcNombre: json["vc_nombre"],
        vcNombreCientifico: json["vc_nombre_cientifico"],
        vcImagen: json["vc_imagen"],
        taxa: Taxa.fromJson(json["taxa"]),
        /*   vcAno: json["vc_ano"],
        idFamilia: json["id_familia"],
        vcSonido: json["vc_sonido"],
        estadosConservacion:
            List<dynamic>.from(json["estados_conservacion"].map((x) => x)),
        fechaCreacion: DateTime.parse(json["fecha_creacion"]),
        fechaModificacion: DateTime.parse(json["fecha_modificacion"]),
        estado: json["estado"], */
      );

  Map<String, dynamic> toJson() => {
        "id_especie": idEspecie,
        "vc_nombre": vcNombre,
        "vc_nombre_cientifico": vcNombreCientifico,
        "vc_imagen": vcImagen,
        "taxa": taxa.toJson(),
        /* "vc_ano": vcAno,
        "id_familia": idFamilia,
        "vc_sonido": vcSonido,
        "estados_conservacion":
            List<dynamic>.from(estadosConservacion.map((x) => x)),
        "fecha_creacion": fechaCreacion.toIso8601String(),
        "fecha_modificacion": fechaModificacion.toIso8601String(),
        "estado": estado, */
      };
  @override
  List<Object?> get props => [
        idEspecie,
        vcNombre,
        vcNombreCientifico,
        vcImagen,
        taxa,
        /*  vcAno,
        idFamilia,
        estadosConservacion,
        vcSonido,
        fechaCreacion,
        fechaModificacion,
        estado, */
      ];
  @override
  bool get stringify => true;
}

class Taxa {
  final int idTaxa;
  final String vcNombre;
  final dynamic vcColorPrimario;
  final dynamic vcColorSecundario;
  final String vcImagen;
  final String estado;

  Taxa({
    required this.idTaxa,
    required this.vcNombre,
    required this.vcColorPrimario,
    required this.vcColorSecundario,
    required this.vcImagen,
    required this.estado,
  });

  factory Taxa.fromJson(Map<String, dynamic> json) => Taxa(
        idTaxa: json["id_taxa"],
        vcNombre: json["vc_nombre"],
        vcColorPrimario: json["vc_color_primario"],
        vcColorSecundario: json["vc_color_secundario"],
        vcImagen: json["vc_imagen"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_taxa": idTaxa,
        "vc_nombre": vcNombre,
        "vc_color_primario": vcColorPrimario,
        "vc_color_secundario": vcColorSecundario,
        "vc_imagen": vcImagen,
        "estado": estado,
      };
}
