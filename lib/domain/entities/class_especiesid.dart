import 'dart:convert';

SpeciesId speciesIdFromJson(String str) => SpeciesId.fromJson(json.decode(str));

String speciesIdToJson(SpeciesId data) => json.encode(data.toJson());

class SpeciesId {
  final int idEspecie;
  final String vcNombre;
  final String vcNombreCientifico;
  final String vcNombreIngles;
  final dynamic vcSonido;
  final String vcAno;
  final String vcImagen;
  final String teDescripcion;
  final String reino;
  final String filo;
  final String clase;
  final String orden;
  final String familia;
  final String tipo;
  final List<String> imagenesEstado;

  SpeciesId({
    required this.idEspecie,
    required this.vcNombre,
    required this.vcNombreCientifico,
    required this.vcNombreIngles,
    required this.vcSonido,
    required this.vcAno,
    required this.vcImagen,
    required this.teDescripcion,
    required this.reino,
    required this.filo,
    required this.clase,
    required this.orden,
    required this.familia,
    required this.tipo,
    required this.imagenesEstado,
  });

  factory SpeciesId.fromJson(Map<String, dynamic> json) => SpeciesId(
        idEspecie: json["id_especie"],
        vcNombre: json["vc_nombre"],
        vcNombreCientifico: json["vc_nombre_cientifico"],
        vcNombreIngles: json["vc_nombre_ingles"],
        vcSonido: json["vc_sonido"],
        vcAno: json["vc_ano"],
        vcImagen: json["vc_imagen"],
        teDescripcion: json["te_descripcion"],
        reino: json["reino"],
        filo: json["filo"],
        clase: json["clase"],
        orden: json["orden"],
        familia: json["familia"],
        tipo: json["tipo"],
        imagenesEstado:
            List<String>.from(json["imagenes_estado"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id_especie": idEspecie,
        "vc_nombre": vcNombre,
        "vc_nombre_cientifico": vcNombreCientifico,
        "vc_nombre_ingles": vcNombreIngles,
        "vc_sonido": vcSonido,
        "vc_ano": vcAno,
        "vc_imagen": vcImagen,
        "te_descripcion": teDescripcion,
        "reino": reino,
        "filo": filo,
        "clase": clase,
        "orden": orden,
        "familia": familia,
        "tipo": tipo,
        "imagenes_estado": List<dynamic>.from(imagenesEstado.map((x) => x)),
      };
}
