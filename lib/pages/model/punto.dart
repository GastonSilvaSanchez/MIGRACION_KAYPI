class PuntoEstrategico {
  final String nombre;
  final String categoria;
  final List<String> calles;
  final String imagen;
  final String zonasCBBA;
  final List<String> lineas;
  final String descripcion;
  final Punto punto;
  //final List<Punto> punto;
  final String marcador;

  const PuntoEstrategico({
    required this.nombre,
    required this.categoria,
    required this.calles,
    required this.imagen,
    required this.zonasCBBA,
    required this.lineas,
    required this.descripcion,
    required this.punto,
    required this.marcador
  });

  factory PuntoEstrategico.fromJson(Map<String, dynamic> json) {
    //var list = json['Punto'] as List;
    //List<Punto> puntoList = list.map((punto) => Punto.fromJson(punto)).toList();
    return new PuntoEstrategico(
      nombre: json['Nombre'],
      categoria: json['Categoria'],
      calles: json['Calles'].cast<String>(),
      imagen: json['Imagen'],
      zonasCBBA: json['ZonasCBBA'],
      lineas: json['Lineas'].cast<String>(),
      descripcion: json['Descripcion'],
      //punto: puntoList,
      punto: Punto.fromJson(json["Punto"]),
      marcador: json['Marcador']
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