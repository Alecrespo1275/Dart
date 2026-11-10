import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/section_title.dart';
import '../../data/tareas_repository.dart';
import '../../domain/tarea.dart';
import '../widgets/resumen_card.dart';
import '../widgets/tarea_tile.dart';
import '../widgets/tareas_header.dart';

// Ensambla la pantalla y obtiene sus tareas desde el repositorio.
class TareasPage extends StatelessWidget {
  const TareasPage({this.repository = const TareasRepository(), super.key});

  final TareasRepository repository;

  @override
  Widget build(BuildContext context) {
    final List<Tarea> tareas = repository.obtenerTareas();
    final int completadas = tareas.where((tarea) => tarea.completada).length;
    final int pendientes = tareas.length - completadas;

    return Scaffold(
      appBar: AppBar(title: const Text('Mis tareas')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSpacing.maxContentWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TareasHeader(),
                  const SizedBox(height: AppSpacing.md),
                  ResumenCard(pendientes: pendientes, completadas: completadas),
                  const SizedBox(height: AppSpacing.md),
                  const SectionTitle('Tareas'),
                  const SizedBox(height: AppSpacing.sm),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tareas.length,
                      itemBuilder: (context, index) {
                        return TareaTile(tarea: tareas[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
