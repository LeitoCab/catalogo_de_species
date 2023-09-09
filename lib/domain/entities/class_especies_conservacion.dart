import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: non_constant_identifier_names
List<EstadosConservacion> EstadosConservacionFromJson(String str) =>
    List<EstadosConservacion>.from(
        json.decode(str).map((x) => EstadosConservacion.fromJson(x)));

// ignore: non_constant_identifier_names
String EstadosConservacionToJson(List<EstadosConservacion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EstadosConservacion extends Equatable {
  final int idEstConservacion;
  final String vcNombre;
  final dynamic teDescripcion;
  final String vcIniciales;
  final String vcInstitucion;
  final String vcImagenEstado;
  final String chEstado;

  const EstadosConservacion({
    required this.idEstConservacion,
    required this.vcNombre,
    required this.teDescripcion,
    required this.vcIniciales,
    required this.vcInstitucion,
    required this.vcImagenEstado,
    required this.chEstado,
  });

  factory EstadosConservacion.fromJson(Map<String, dynamic> json) =>
      EstadosConservacion(
        idEstConservacion: json["id_est_conservacion"],
        vcNombre: json["vc_nombre"],
        teDescripcion: json["te_descripcion"],
        vcIniciales: json["vc_iniciales"],
        vcInstitucion: json["vc_institucion"],
        vcImagenEstado: json["vc_imagen_estado"],
        chEstado: json["ch_estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_est_conservacion": idEstConservacion,
        "vc_nombre": vcNombre,
        "te_descripcion": teDescripcion,
        "vc_iniciales": vcIniciales,
        "vc_institucion": vcInstitucion,
        "vc_imagen_estado": vcImagenEstado,
        "ch_estado": chEstado,
      };

  @override
  List<Object?> get props => [
        idEstConservacion,
        vcNombre,
        teDescripcion,
        vcIniciales,
        vcInstitucion,
        vcImagenEstado,
        chEstado,
      ];
  @override
  bool get stringify => true;
}
