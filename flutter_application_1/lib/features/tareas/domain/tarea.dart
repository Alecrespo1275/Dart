// Representa una tarea sin depender de Flutter.
class Tarea {
  const Tarea({
    required this.id,
    required this.titulo,
    required this.categoria,
    this.completada = false,
  });

  final int id;
  final String titulo;
  final String categoria;
  final bool completada;

  Tarea copyWith({bool? completada}) {
    return Tarea(
      id: id,
      titulo: titulo,
      categoria: categoria,
      completada: completada ?? this.completada,
    );
  }
}
