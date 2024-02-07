// ignore_for_file: deprecated_member_use

import 'package:client_control/components/icon_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Icon Picker Test', (WidgetTester tester) async {
    IconData? selectedIcon;

    // isso constroi o app e acione o frame
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async {
              selectedIcon = await showIconPicker(context: context);
            },
            child: Text('Show Icon Picker'),
          ),
        ),
      ),
    );

    // da um toque no botão para abrir a cx de dialogo
    await tester.tap(find.text('Show Icon Picker'));
    await tester.pumpAndSettle(); //espera a cx abrir

    // espera que o texto apareça corretamente
    expect(find.text('Escolha um ícone'), findsOneWidget);

    // escolhe um icone
    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle(); // esper a cx fechar

    // verifica se o icone subiu
    expect(selectedIcon, Icons.card_giftcard);
  });
}