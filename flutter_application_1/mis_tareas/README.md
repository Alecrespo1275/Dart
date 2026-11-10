# Mis tareas

Proyecto Flutter educativo que organiza una pequeña lista de tareas usando una arquitectura modular *feature-first*.

## Estructura

```text
lib/
├── main.dart
├── app/
│   └── app.dart
├── core/
│   ├── constants/
│   │   └── app_spacing.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── widgets/
│       └── section_title.dart
└── features/
    └── tareas/
        ├── tareas.dart
        ├── domain/
        │   └── tarea.dart
        ├── data/
        │   └── tareas_repository.dart
        └── presentation/
            ├── pages/
            │   └── tareas_page.dart
            └── widgets/
                ├── tareas_header.dart
                ├── resumen_card.dart
                └── tarea_tile.dart
test/
└── features/
    └── tareas/
        └── tareas_page_test.dart
assets/
└── images/
    └── .gitkeep
```

## Qué hace cada parte

- `main.dart`: arranca Flutter con `runApp`.
- `app/app.dart`: configura el título, los temas claro y oscuro y la pantalla inicial.
- `core/constants/app_spacing.dart`: reúne los espaciados comunes y el ancho máximo.
- `core/theme/app_theme.dart`: define los temas Material 3 basados en indigo.
- `core/widgets/section_title.dart`: ofrece un título reutilizable para secciones.
- `features/tareas/tareas.dart`: expone la API pública de la funcionalidad.
- `domain/tarea.dart`: modelo inmutable de tarea, sin dependencias de Flutter.
- `data/tareas_repository.dart`: devuelve cinco tareas de ejemplo guardadas en memoria.
- `presentation/pages/tareas_page.dart`: compone la pantalla y solicita los datos al repositorio.
- `presentation/widgets/`: contiene la cabecera, el resumen y cada fila de tarea.
- `test/features/tareas/tareas_page_test.dart`: verifica el contenido y una pantalla estrecha sin overflow.
- `assets/images/`: espacio para imágenes; `.gitkeep` permite conservar la carpeta vacía en Git.

## Reglas de arquitectura

1. `core/` contiene elementos compartidos y no importa código de `features/`.
2. Desde fuera de una funcionalidad, se importa su barrel `features/tareas/tareas.dart`.
3. `domain/` contiene modelos Dart puros y no importa Flutter.
4. Las pantallas no crean los datos: se los solicitan al repositorio.
5. No se usan paquetes externos ni gestores de estado.

## Comandos

Desde la carpeta del proyecto:

```bash
flutter pub get
flutter run
dart format lib test
flutter analyze
flutter test
```
