class PuntoEstrategicos {
  final String nombre;
  final String categoria;
  final List<String> calles;
  final String imagen;
  final String zonasCbba;
  final List<String> lineas;
  final String descripcion;
  final List<Punto> punto;
  final String marcador;

  const PuntoEstrategicos(
      {required this.nombre,
      required this.categoria,
      required this.calles,
      required this.imagen,
      required this.zonasCbba,
      required this.lineas,
      required this.descripcion,
      required this.punto,
      required this.marcador});

  factory PuntoEstrategicos.fromJson(Map<String, dynamic> json) {
    var list = json['Punto'] as List;

    List<Punto> puntosList =
        list.map((punto) => Punto.fromJson(punto)).toList();

    return new PuntoEstrategicos(
      nombre: json["Nombre"],
      categoria: json["Categoria"],
      calles: json['Calles'].cast<String>(),
      imagen: json["Imagen"],
      zonasCbba: json["ZonasCBBA"],
      lineas: json["Lineas"].cast<String>(),
      descripcion: json["Descripcion"],
      punto: puntosList,
      marcador: json["Marcador"],
    );
  }
}

class Punto {
  final double lat;

  final double lng;

  Punto({
    required this.lat,
    required this.lng,
  });

  factory Punto.fromJson(Map<String, dynamic> json) {
    return new Punto(
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
    );
  }
}
