import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qualite_mobile_s5/main.dart';

void main() {
  testWidgets('Affichage des éléments et déclenchement du dialogue', (WidgetTester tester) async {
    await tester.pumpWidget(const MonApplication());

    // Vérification de l'interface initiale
    expect(find.text('Liste des étudiants'), findsOneWidget);
    expect(find.text('Nom: Alice'), findsOneWidget);
    expect(find.text('Calculer la moyenne de la classe'), findsOneWidget);

    // Clic sur le bouton de calcul
    await tester.tap(find.text('Calculer la moyenne de la classe'));
    await tester.pumpAndSettle();

    // Vérification de la pop-up
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Moyenne des étudiants'), findsOneWidget);
    expect(find.text('La moyenne des étudiants est: 14.35'), findsOneWidget);

    // Fermeture du dialogue
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });
}