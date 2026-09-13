import 'package:flutter_test/flutter_test.dart';
import 'package:qualite_mobile_s5/main.dart';

void main() {
  group('Tests unitaires - calculateMoyenne', () {
    test('Calcul standard conforme aux données du sujet (14.35)', () {
      final list = [
        const Etudiant(nom: 'Alice', moyenne: 17.25),
        const Etudiant(nom: 'Bob', moyenne: 16.5),
        const Etudiant(nom: 'Charlie', moyenne: 11.75),
        const Etudiant(nom: 'David', moyenne: 12.75),
        const Etudiant(nom: 'Eve', moyenne: 13.5),
      ];
      final result = calculateMoyenne(list);
      expect(result, closeTo(14.35, 0.001));
    });

    test('Cas simple : deux étudiants', () {
      final list = [
        const Etudiant(nom: 'A', moyenne: 10.0),
        const Etudiant(nom: 'B', moyenne: 14.0),
      ];
      expect(calculateMoyenne(list), equals(12.0));
    });

    test('Cas limite : liste vide', () {
      expect(calculateMoyenne([]), equals(0.0));
    });
  });
}