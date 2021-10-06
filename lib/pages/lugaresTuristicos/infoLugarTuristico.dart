class InforLugarTuristico {
  final String nombre;
  final String categoria;
  final List<String> calles;
  final String imagen;
  final String descripcion;

  const InforLugarTuristico({
    required this.nombre,
    required this.categoria,
    required this.calles,
    required this.imagen,
    required this.descripcion,
  });

  factory InforLugarTuristico.fromJson(Map<String, dynamic> json) {
    //var list = json['Rutas'] as List;
    //List<Ruta> rutasList = list.map((ruta) => Ruta.fromJson(ruta)).toList();
    return new InforLugarTuristico(
      nombre: json['Nombre'],
      categoria: json['Categoria'],
      calles: json['Calles'].cast<String>(),
      imagen: json['Imagen'],
      descripcion: json['Descripcion'],
    );
  }
}
