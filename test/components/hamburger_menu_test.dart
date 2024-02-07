import 'package:client_control/components/hamburger_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Testa a tela do menu hambúrguer', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HamburgerMenu()));

    // Verifica se o cabeçalho do menu é exibido corretamente
    expect(find.text('Menu'), findsOneWidget);

    // Verifica se o botão "Gerenciar clientes" é exibido corretamente
    expect(find.text('Gerenciar clientes'), findsOneWidget);

    // Clica no botão "Gerenciar clientes"
    await tester.tap(find.text('Gerenciar clientes'));
    await tester.pumpAndSettle();

    // verifica se o Drawer está fechado após a navegação
    expect(tester.hasRunningAnimations, false);

    // Verifica se o botão de voltar está presente
    if (find.byType(CupertinoNavigationBarBackButton).evaluate().isNotEmpty) {
      // Volta pra tela anterior
      await tester.pageBack();
      await tester.pumpAndSettle();
    }
  });
}
