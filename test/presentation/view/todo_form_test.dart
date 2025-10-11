import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/presentation/view/todo_form.dart';
import 'package:clean_architecture_todo_app/presentation/utils/constants.dart';

void main() {
  group('TodoForm Widget Tests', () {
    testWidgets('Creates new todo form', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: TodoFormPage(),
          ),
        ),
      );

      // Verify title
      expect(find.text('Add TODO'), findsOneWidget);

      // Verify form fields exist
      expect(find.widgetWithText(TextFormField, 'Title'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Description'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Due Date'), findsOneWidget);

      // Input some values
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Title'),
        'Test Todo',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Description'),
        'Test Description',
      );

      await tester.pump();

      // Verify inputs are saved
      expect(find.text('Test Todo'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });

    testWidgets('Edits existing todo', (tester) async {
      final todo = Todo(
        id: 1,
        title: 'Existing Todo',
        description: 'Existing Description',
        isCompleted: false,
        dueDate: DateTime(2025, 10, 12),
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TodoFormPage(todo: todo),
          ),
        ),
      );

      // Verify title
      expect(find.text('Edit TODO'), findsOneWidget);

      // Verify existing values
      expect(find.text('Existing Todo'), findsOneWidget);
      expect(find.text('Existing Description'), findsOneWidget);
      expect(find.text(dateFormat.format(todo.dueDate)), findsOneWidget);
    });

    testWidgets('Shows validation errors', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: TodoFormPage(),
          ),
        ),
      );

      // Try to save empty form
      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      // Verify validation error
      expect(find.text('Enter a title.'), findsOneWidget);

      // Enter too long title
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Title'),
        'This is a very long title that should show an error',
      );
      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      // Verify validation error
      expect(find.text('Limit the title to 20 characters.'), findsOneWidget);
    });
  });
}