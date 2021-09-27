class Linea {
  final String nombre;
  final String categoria;
  final List<int> telefonos;
  final List<String> pasajes;
  final List<String> horarios;
  final List<String> calles;
  final String imagen;
  final List<String> zonasCBBA;

  const Linea({
    required this.nombre,
    required this.categoria,
    required this.telefonos,
    required this.pasajes,
    required this.horarios,
    required this.calles,
    required this.imagen,
    required this.zonasCBBA,
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
    );
  }
}
