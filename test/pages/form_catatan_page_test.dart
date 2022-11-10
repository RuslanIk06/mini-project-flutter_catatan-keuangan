import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catatan_keuangan/pages/form_catatan_page.dart';
import 'package:catatan_keuangan/components/colors_style.dart';

void main() {
  group('Form Catatan', () {
    testWidgets('Catatan', (WidgetTester tester) async {
      final catatan = find.byKey(const ValueKey('catatan'));

      await tester.pumpWidget(const MaterialApp(
        home: FormCatatan(),
      ));

      // Test Body
      await tester.enterText(catatan, 'Puyeng');
      await tester.pump();

      // Check Outputs
      expect(find.text('Puyeng'), findsOneWidget);
      expect(
          find.ancestor(
              of: find.byType(Text), matching: find.byType(ElevatedButton)),
          findsOneWidget);
    });
  });
}
