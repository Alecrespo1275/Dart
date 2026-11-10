import '../domain/tarea.dart';

// Proporciona las tareas de ejemplo almacenadas en memoria.
class TareasRepository {
  const TareasRepository();

  List<Tarea> obtenerTareas() {
    return const [
      Tarea(id: 1, titulo: 'Repasar Row y Column', categoria: 'Estudio'),
      Tarea(
        id: 2,
        titulo: 'Maquetar la cabecera',
        categoria: 'Práctica',
        completada: true,
      ),
      Tarea(
        id: 3,
        titulo: 'Probar la app en dos anchos',
        categoria: 'Práctica',
      ),
      Tarea(
        id: 4,
        titulo: 'Corregir un overflow con Expanded',
        categoria: 'Reto',
      ),
      Tarea(id: 5, titulo: 'Hacer dos capturas', categoria: 'Entrega'),
    ];
  }
}
