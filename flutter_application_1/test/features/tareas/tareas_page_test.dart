import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app/app.dart';

void main() {
  testWidgets('muestra el resumen y las tareas', (tester) async {
    await tester.pumpWidget(const MisTareasApp());

    expect(find.text('Mis tareas'), findsOneWidget);
    expect(find.text('Pendientes'), findsOneWidget);
    expect(find.text('Completadas'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Repasar Row y Column'), findsOneWidget);
  });

  testWidgets('al pulsar una tarea alterna estado y actualiza el resumen', (
    tester,
  ) async {
    await tester.pumpWidget(const MisTareasApp());

    await tester.tap(find.text('Repasar Row y Column'));
    await tester.pump();

    expect(find.text('3'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('Repasar Row y Column')).style?.decoration,
      TextDecoration.lineThrough,
    );

    await tester.tap(find.text('Repasar Row y Column'));
    await tester.pump();

    expect(find.text('4'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('Repasar Row y Column')).style?.decoration,
      isNull,
    );
  });

  testWidgets('no produce overflow en una pantalla estrecha', (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MisTareasApp());

    expect(tester.takeException(), isNull);
  });
}
