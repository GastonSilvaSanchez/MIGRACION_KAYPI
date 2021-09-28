class Linea {
  final String nombre;
  final String categoria;
  final List<int> telefonos;
  final List<String> pasajes;
  final List<String> horarios;
  final List<String> calles;
  final String imagen;
  final List<String> zonasCBBA;
  final List<Ruta> ruta;

  const Linea({
    required this.nombre,
    required this.categoria,
    required this.telefonos,
    required this.pasajes,
    required this.horarios,
    required this.calles,
    required this.imagen,
    required this.zonasCBBA,
    required this.ruta,
  });

  factory Linea.fromJson(Map<String, dynamic> json) {
    return new Linea(
      nombre: json['Nombre'],
      categoria: json['Categoria'],
      telefonos: json['Telefonos'].cast<int>(),
      pasajes: json['Pasajes'].cast<String>(),
      horarios: json['Horarios'].cast<String>(),
      calles: json['Calles'].cast<String>(),
      imagen: json['Imagen'],
      zonasCBBA: json['ZonasCBBA'].cast<String>(),
      ruta: json['Rutas'].cast<Ruta>(),
    );
  }
}

class Ruta {
  final String sentido;
  final String color;
  final List<Puntos> puntos;

  Ruta({
    required this.sentido,
    required this.color,
    required this.puntos,
  });

  factory Ruta.fromJson(Map<String, dynamic> json) {
    return new Ruta(
      sentido: json['sentido'].cast<String>(),
      color: json['Color'].cast<String>(),
      puntos: json['Puntos'].cast<Puntos>(),
    );
  }
}

class Puntos {

  final double lat;
  final double lng;

  Puntos({
    required this.lat,
    required this.lng,
  });

  factory Puntos.fromJson(Map<String, dynamic> json) {
    return new Puntos(
      lat: json['lat'].cast<double>(),
      lng: json['lng'].cast<double>(),
    );
  }

}
