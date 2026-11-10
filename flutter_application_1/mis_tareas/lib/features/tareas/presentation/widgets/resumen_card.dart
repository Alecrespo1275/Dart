import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';

// Resume cuántas tareas están pendientes y completadas.
class ResumenCard extends StatelessWidget {
  const ResumenCard({
    required this.pendientes,
    required this.completadas,
    super.key,
  });

  final int pendientes;
  final int completadas;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Expanded(
              child: _ResumenItem(etiqueta: 'Pendientes', cantidad: pendientes),
            ),
            Expanded(
              child: _ResumenItem(
                etiqueta: 'Completadas',
                cantidad: completadas,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Presenta una etiqueta y su cantidad en el resumen.
class _ResumenItem extends StatelessWidget {
  const _ResumenItem({required this.etiqueta, required this.cantidad});

  final String etiqueta;
  final int cantidad;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          '$cantidad',
          style: textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(etiqueta, textAlign: TextAlign.center),
      ],
    );
  }
}
