import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/tareas/tareas.dart';

// Configura el tema y la pantalla inicial de la aplicación.
class MisTareasApp extends StatelessWidget {
  const MisTareasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis tareas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const TareasPage(),
    );
  }
}
