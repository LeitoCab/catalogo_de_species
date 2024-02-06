import 'dart:convert';

List<SpeciesId> speciesIdFromJson(String str) =>
    List<SpeciesId>.from(json.decode(str).map((x) => SpeciesId.fromJson(x)));

String speciesIdToJson(List<SpeciesId> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpeciesId {
  final int idEspecie;
  final String vcNombre;
  final String vcNombreCientifico;
  final String vcNombreIngles;
  final String vcAno;
  final String teDescripcion;
  final String vcSonido;
  final String vcImagen;
  final Taxa taxa;
  final Taxonomia taxonomia;
  final List<EstadosConservacion> estadosConservacion;
  final List<Autore> autores;
  final dynamic fechaCreacion;
  final DateTime fechaModificacion;
  final String estado;

  SpeciesId({
    required this.idEspecie,
    required this.vcNombre,
    required this.vcNombreCientifico,
    required this.vcNombreIngles,
    required this.vcAno,
    required this.teDescripcion,
    required this.vcSonido,
    required this.vcImagen,
    required this.taxa,
    required this.taxonomia,
    required this.estadosConservacion,
    required this.autores,
    required this.fechaCreacion,
    required this.fechaModificacion,
    required this.estado,
  });

  factory SpeciesId.fromJson(Map<String, dynamic> json) => SpeciesId(
        idEspecie: json["id_especie"],
        vcNombre: json["vc_nombre"],
        vcNombreCientifico: json["vc_nombre_cientifico"],
        vcNombreIngles: json["vc_nombre_ingles"],
        vcAno: json["vc_ano"],
        teDescripcion: json["te_descripcion"],
        vcSonido: json["vc_sonido"],
        vcImagen: json["vc_imagen"],
        taxa: Taxa.fromJson(json["taxa"]),
        taxonomia: Taxonomia.fromJson(json["taxonomia"]),
        estadosConservacion: List<EstadosConservacion>.from(
            json["estados_conservacion"]
                .map((x) => EstadosConservacion.fromJson(x))),
        autores:
            List<Autore>.from(json["autores"].map((x) => Autore.fromJson(x))),
        fechaCreacion: json["fecha_creacion"],
        fechaModificacion: DateTime.parse(json["fecha_modificacion"]),
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_especie": idEspecie,
        "vc_nombre": vcNombre,
        "vc_nombre_cientifico": vcNombreCientifico,
        "vc_nombre_ingles": vcNombreIngles,
        "vc_ano": vcAno,
        "te_descripcion": teDescripcion,
        "vc_sonido": vcSonido,
        "vc_imagen": vcImagen,
        "taxa": taxa.toJson(),
        "taxonomia": taxonomia.toJson(),
        "estados_conservacion":
            List<dynamic>.from(estadosConservacion.map((x) => x.toJson())),
        "autores": List<dynamic>.from(autores.map((x) => x.toJson())),
        "fecha_creacion": fechaCreacion,
        "fecha_modificacion": fechaModificacion.toIso8601String(),
        "estado": estado,
      };
}

class Autore {
  final int idAutor;
  final String vcNombre;
  final String anoNacimientoAutor;
  final String anoDecesoAutor;
  final String biografiaAutor;
  final String profesionAutor;
  final int actualizado;
  final String imagenAutor;
  final String estadoAutor;

  Autore({
    required this.idAutor,
    required this.vcNombre,
    required this.anoNacimientoAutor,
    required this.anoDecesoAutor,
    required this.biografiaAutor,
    required this.profesionAutor,
    required this.actualizado,
    required this.imagenAutor,
    required this.estadoAutor,
  });

  factory Autore.fromJson(Map<String, dynamic> json) => Autore(
        idAutor: json["id_autor"],
        vcNombre: json["vc_nombre"],
        anoNacimientoAutor: json["ano_nacimiento_autor"],
        anoDecesoAutor: json["ano_deceso_autor"],
        biografiaAutor: json["biografia_autor"],
        profesionAutor: json["profesion_autor"],
        actualizado: json["actualizado"],
        imagenAutor: json["imagen_autor"],
        estadoAutor: json["estado_autor"],
      );

  Map<String, dynamic> toJson() => {
        "id_autor": idAutor,
        "vc_nombre": vcNombre,
        "ano_nacimiento_autor": anoNacimientoAutor,
        "ano_deceso_autor": anoDecesoAutor,
        "biografia_autor": biografiaAutor,
        "profesion_autor": profesionAutor,
        "actualizado": actualizado,
        "imagen_autor": imagenAutor,
        "estado_autor": estadoAutor,
      };
}

class EstadosConservacion {
  final int idEstado;
  final String vcNombre;
  final String inicialesEstado;
  final String institucion;
  final String imagenEstado;
  final String estado;

  EstadosConservacion({
    required this.idEstado,
    required this.vcNombre,
    required this.inicialesEstado,
    required this.institucion,
    required this.imagenEstado,
    required this.estado,
  });

  factory EstadosConservacion.fromJson(Map<String, dynamic> json) =>
      EstadosConservacion(
        idEstado: json["id_estado"],
        vcNombre: json["vc_nombre"],
        inicialesEstado: json["iniciales_estado"],
        institucion: json["institucion"],
        imagenEstado: json["imagen_estado"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_estado": idEstado,
        "vc_nombre": vcNombre,
        "iniciales_estado": inicialesEstado,
        "institucion": institucion,
        "imagen_estado": imagenEstado,
        "estado": estado,
      };
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

class Taxonomia {
  final Reino reino;
  final Filo filo;
  final Clase clase;
  final Orden orden;
  final Familia familia;

  Taxonomia({
    required this.reino,
    required this.filo,
    required this.clase,
    required this.orden,
    required this.familia,
  });

  factory Taxonomia.fromJson(Map<String, dynamic> json) => Taxonomia(
        reino: Reino.fromJson(json["reino"]),
        filo: Filo.fromJson(json["filo"]),
        clase: Clase.fromJson(json["clase"]),
        orden: Orden.fromJson(json["orden"]),
        familia: Familia.fromJson(json["familia"]),
      );

  Map<String, dynamic> toJson() => {
        "reino": reino.toJson(),
        "filo": filo.toJson(),
        "clase": clase.toJson(),
        "orden": orden.toJson(),
        "familia": familia.toJson(),
      };
}

class Clase {
  final int idClase;
  final String vcNombre;

  Clase({
    required this.idClase,
    required this.vcNombre,
  });

  factory Clase.fromJson(Map<String, dynamic> json) => Clase(
        idClase: json["id_clase"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_clase": idClase,
        "vc_nombre": vcNombre,
      };
}

class Familia {
  final int idFamilia;
  final String vcNombre;

  Familia({
    required this.idFamilia,
    required this.vcNombre,
  });

  factory Familia.fromJson(Map<String, dynamic> json) => Familia(
        idFamilia: json["id_familia"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_familia": idFamilia,
        "vc_nombre": vcNombre,
      };
}

class Filo {
  final int idFilo;
  final String vcNombre;

  Filo({
    required this.idFilo,
    required this.vcNombre,
  });

  factory Filo.fromJson(Map<String, dynamic> json) => Filo(
        idFilo: json["id_filo"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_filo": idFilo,
        "vc_nombre": vcNombre,
      };
}

class Orden {
  final int idOrden;
  final String vcNombre;

  Orden({
    required this.idOrden,
    required this.vcNombre,
  });

  factory Orden.fromJson(Map<String, dynamic> json) => Orden(
        idOrden: json["id_orden"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_orden": idOrden,
        "vc_nombre": vcNombre,
      };
}

class Reino {
  final int idReino;
  final String vcNombre;

  Reino({
    required this.idReino,
    required this.vcNombre,
  });

  factory Reino.fromJson(Map<String, dynamic> json) => Reino(
        idReino: json["id_reino"],
        vcNombre: json["vc_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id_reino": idReino,
        "vc_nombre": vcNombre,
      };
}
