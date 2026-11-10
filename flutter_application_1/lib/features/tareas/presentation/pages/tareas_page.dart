import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/section_title.dart';
import '../../data/tareas_repository.dart';
import '../../domain/tarea.dart';
import '../widgets/resumen_card.dart';
import '../widgets/tarea_tile.dart';
import '../widgets/tareas_header.dart';

// Ensambla la pantalla, mantiene el estado y obtiene tareas del repositorio.
class TareasPage extends StatefulWidget {
  const TareasPage({this.repository = const TareasRepository(), super.key});

  final TareasRepository repository;

  @override
  State<TareasPage> createState() => _TareasPageState();
}

class _TareasPageState extends State<TareasPage> {
  late final List<Tarea> _tareas;

  @override
  void initState() {
    super.initState();
    _tareas = List<Tarea>.of(widget.repository.obtenerTareas());
  }

  void _alternarCompletada(int index) {
    setState(() {
      final tarea = _tareas[index];
      _tareas[index] = tarea.copyWith(completada: !tarea.completada);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int completadas = _tareas.where((tarea) => tarea.completada).length;
    final int pendientes = _tareas.length - completadas;
    final bool todasHechas = _tareas.isNotEmpty && completadas == _tareas.length;
    void _reiniciar() {
    setState(() {
      if(completadas > 0 ){

      }
    });
  }
    void _eliminarCompletadas() {
    setState(() {
      _tareas.removeWhere((tarea) => tarea.completada);
    });
  }
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
                  TextButton(
                  onPressed: todasHechas ? _eliminarCompletadas : null,
                  child: const Text('Eliminar tareas'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _tareas.length,
                      itemBuilder: (context, index) {
                        return TareaTile(
                          tarea: _tareas[index],
                          onTap: () => _alternarCompletada(index),
                        );
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
