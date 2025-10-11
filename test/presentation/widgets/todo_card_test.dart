import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/presentation/widgets/todo_card.dart';

void main() {
  group('TodoCard Widget Tests', () {
    final todo = Todo(
      id: 1,
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
      dueDate: DateTime(2025, 10, 12),
    );

    testWidgets('Renders todo information correctly', (tester) async {
      bool onTapCalled = false;

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TodoCard(
                todo: todo,
                onTap: () => onTapCalled = true,
              ),
            ),
          ),
        ),
      );

      // Verify the title is displayed
      expect(find.text('Test Todo'), findsOneWidget);

      // Verify the description is displayed
      expect(find.text('Test Description'), findsOneWidget);

      // Verify the due date is displayed (formatted)
      expect(find.text('Oct 12, 2025'), findsOneWidget);

      // Tap the card
      await tester.tap(find.byType(Card));
      expect(onTapCalled, isTrue);

      // Verify checkbox exists and is not checked
      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, isFalse);
    });

    testWidgets('Handles empty description', (tester) async {
      final todoNoDesc = Todo(
        id: 1,
        title: 'Test Todo',
        description: null,
        isCompleted: false,
        dueDate: DateTime(2025, 10, 12),
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TodoCard(
                todo: todoNoDesc,
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      // Verify 'No Description' is shown when description is empty
      expect(find.text('No Description'), findsOneWidget);
    });
  });
}