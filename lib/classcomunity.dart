import 'dart:convert';

Comunidades comunidadesFromJson(String str) =>
    Comunidades.fromJson(json.decode(str));

String comunidadesToJson(Comunidades data) => json.encode(data.toJson());

class Comunidades {
  String imagen;
  String titulo;
  String subtitulo1;
  String subtitulo2;
  String subtitulo3;

  Comunidades(this.imagen, this.titulo, this.subtitulo1, this.subtitulo2,
      this.subtitulo3);

  factory Comunidades.fromJson(Map<String, dynamic> json) => Comunidades(
        json["imagen"],
        json["titulo"],
        json["subtitulo1"],
        json["subtitulo2"],
        json["subtitulo3"],
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "titulo": titulo,
        "subtitulo1": subtitulo1,
        "subtitulo2": subtitulo2,
        "subtitulo3": subtitulo3,
      };
}

class Especiess {
  String imagen;
  String titulo;
  String subtitulo1;
  String subtitulo2;

  Especiess(
    this.imagen,
    this.titulo,
    this.subtitulo1,
    this.subtitulo2,
  );
}
