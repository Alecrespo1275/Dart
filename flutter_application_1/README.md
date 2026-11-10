# Mis tareas

Proyecto educativo Flutter para practicar composición de interfaces con widgets
y organización modular *feature-first*.

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

## Archivos

- `main.dart`: inicia la interfaz con `runApp`.
- `app/app.dart`: configura título, temas claro y oscuro, y pantalla inicial.
- `core/constants/app_spacing.dart`: centraliza los espaciados y el ancho máximo.
- `core/theme/app_theme.dart`: define los temas Material 3 con semilla indigo.
- `core/widgets/section_title.dart`: dibuja títulos reutilizables de sección.
- `features/tareas/tareas.dart`: barrel público de la funcionalidad de tareas.
- `domain/tarea.dart`: modelo inmutable Dart, independiente de Flutter.
- `data/tareas_repository.dart`: entrega cinco tareas de ejemplo en memoria.
- `presentation/pages/tareas_page.dart`: solicita las tareas al repositorio y construye la pantalla.
- `presentation/widgets/`: presenta cabecera, resumen y filas de tareas; al pulsar una fila se alterna su estado.
- `test/features/tareas/tareas_page_test.dart`: verifica contenido, cambio de estado y ausencia de overflow en ancho reducido.

## Reglas de arquitectura

1. `core/` es compartido y no depende de `features/`.
2. Desde fuera de una feature, se importa su barrel `features/tareas/tareas.dart`.
3. `domain/` no importa Flutter.
4. Las pantallas piden los datos al repositorio en lugar de crearlos.
5. Se usan constructores clásicos, comentarios breves en español y no se añaden paquetes ni gestores de estado.

## Ejecutar y comprobar

Desde la carpeta del proyecto:

```bash
flutter pub get
flutter run
dart format lib test
flutter analyze
flutter test
```
