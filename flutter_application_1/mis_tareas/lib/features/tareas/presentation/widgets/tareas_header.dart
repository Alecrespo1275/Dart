import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';

// Saluda y presenta el resumen de la jornada.
class TareasHeader extends StatelessWidget {
  const TareasHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hola 👋', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.xs),
        const Text('Esto es lo que tienes para hoy'),
      ],
    );
  }
}
