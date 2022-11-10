import 'package:catatan_keuangan/pages/starter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Home Page", () {
    testWidgets(
      'testing Home Page',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: StarterPage(),
        ));
        expect(find.text('Get Started'), findsOneWidget);
        final testBody = await find.ancestor(
          of: find.byType(Column),
          matching: find.byType(Scaffold),
        );
        expect(testBody, findsWidgets);

        // final testForm = await find.ancestor(
        //   of: find.byType(Form),
        //   matching: find.byType(SingleChildScrollView),
        // );
        // expect(testForm, findsWidgets);

        // final testColumn = await find.ancestor(
        //   of: find.byType(Column),
        //   matching: find.byType(Form),
        // );
        // expect(testColumn, findsWidgets);

        // final TestWidgetTextFormField = await find.ancestor(
        //   of: find.byType(TextFormField),
        //   matching: find.byType(Column),
        // );
        // expect(TestWidgetTextFormField, findsWidgets);

        // final TestWidgetElevatedButton = await find.ancestor(
        //   of: find.byType(ElevatedButton),
        //   matching: find.byType(Column),
        // );
        // expect(TestWidgetElevatedButton, findsWidgets);
      },
    );

    // testWidgets(
    //   'Task 02_Home Page',
    //   (WidgetTester tester) async {
    //     await tester.pumpWidget(const MaterialApp(
    //       home: AddContactPage(),
    //     ));
    //     expect(find.text('Create New'), findsNothing);
    //     final testBody = find.ancestor(
    //       of: find.byType(SingleChildScrollView),
    //       matching: find.byType(Form),
    //     );
    //     expect(testBody, findsNothing);

    //     final testForm = find.ancestor(
    //       of: find.byType(Form),
    //       matching: find.byType(Form),
    //     );
    //     expect(testForm, findsNothing);

    //     final testColumn = find.ancestor(
    //       of: find.byType(Column),
    //       matching: find.byType(ElevatedButtonTheme),
    //     );
    //     expect(testColumn, findsNothing);

    //     final TestWidgetTextFormField = find.ancestor(
    //       of: find.byType(TextFormField),
    //       matching: find.byType(Text),
    //     );
    //     expect(TestWidgetTextFormField, findsNothing);

    //     final TestWidgetElevatedButton = find.ancestor(
    //       of: find.byType(ElevatedButton),
    //       matching: find.byType(Text),
    //     );
    //     expect(TestWidgetElevatedButton, findsNothing);
    //   },
    // );
  });
}
