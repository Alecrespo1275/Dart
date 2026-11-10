import 'package:flutter/material.dart';

import '../../domain/tarea.dart';

// Muestra una tarea con su estado y categoría.
class TareaTile extends StatelessWidget {
  const TareaTile({required this.tarea, super.key});

  final Tarea tarea;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        tarea.completada ? Icons.check_circle : Icons.radio_button_unchecked,
      ),
      title: Text(
        tarea.titulo,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: tarea.completada ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        tarea.categoria,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
