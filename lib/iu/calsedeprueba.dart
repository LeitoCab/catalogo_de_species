void main() {
  /*  Map<String, Especiess> especiesMap = {};

  especiess.forEach((especie) {
    especiesMap[especie.titulo] = especie;
  }); */

/*   List<Especiess> especiestolist = especiess.toList();
  print(especiestolist.length); */
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

  get getImagen => imagen;
  get getTitulo => titulo;
  get getSubtitulo1 => subtitulo1;
  get getSubtitulo2 => subtitulo2;

  set setImagen(String imagen) => this.imagen = imagen;
  set setTitulo(String titulo) => this.titulo = titulo;
  set setSubtitulo1(String subtitulo1) => this.subtitulo1 = subtitulo1;
  set setSubtitulo2(String subtitulo2) => this.subtitulo2 = subtitulo2;

  factory Especiess.fromJson(Map<String, dynamic> json) => Especiess(
        json["imagen"],
        json["titulo"],
        json["subtitulo1"],
        json["subtitulo2"],
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "titulo": titulo,
        "subtitulo1": subtitulo1,
        "subtitulo2": subtitulo2,
      };
}
