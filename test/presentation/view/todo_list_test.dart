import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/presentation/view/todo_list.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list.dart';
import 'package:clean_architecture_todo_app/presentation/widgets/todo_card.dart';

final mockTodos = [
  Todo(
    id: 1,
    title: 'First Todo',
    description: 'First Description',
    isCompleted: false,
    dueDate: DateTime(2025, 10, 12),
  ),
  Todo(
    id: 2,
    title: 'Second Todo',
    description: 'Second Description',
    isCompleted: true,
    dueDate: DateTime(2025, 10, 13),
  ),
];

class MockTodoListNotifier extends AutoDisposeAsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async => mockTodos;
}

void main() {
  group('TodoList Widget Tests', () {
    testWidgets('Renders todos and filter chips', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            todoListViewModelProvider.overrideWith(() => MockTodoListViewModel()),
          ],
          child: MaterialApp(
            home: TodoListPage(),
          ),
        ),
      );

      // Wait for async operations
      await tester.pumpAndSettle();

      // Verify app bar title
      expect(find.text('TODO App'), findsOneWidget);

      // Verify filter chips exist
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);
      expect(find.text('Incomplete'), findsOneWidget);

      // Verify todos are displayed
      expect(find.text('First Todo'), findsOneWidget);
      expect(find.text('First Description'), findsOneWidget);
      expect(find.text('Second Todo'), findsOneWidget);
      expect(find.text('Second Description'), findsOneWidget);

      // Verify todo cards
      expect(find.byType(TodoCard), findsNWidgets(2));

      // Verify action buttons
      expect(find.byIcon(Icons.delete_sweep), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('Filters todos correctly', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            todoListViewModelProvider.overrideWith(() => MockTodoListViewModel()),
          ],
          child: MaterialApp(
            home: TodoListPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap completed filter
      await tester.tap(find.text('Completed'));
      await tester.pumpAndSettle();

      // Should only show completed todo
      expect(find.text('Second Todo'), findsOneWidget);
      expect(find.text('First Todo'), findsNothing);

      // Tap incomplete filter
      await tester.tap(find.text('Incomplete'));
      await tester.pumpAndSettle();

      // Should only show incomplete todo
      expect(find.text('First Todo'), findsOneWidget);
      expect(find.text('Second Todo'), findsNothing);

      // Tap all filter
      await tester.tap(find.text('All'));
      await tester.pumpAndSettle();

      // Should show all todos
      expect(find.text('First Todo'), findsOneWidget);
      expect(find.text('Second Todo'), findsOneWidget);
    });
  });
}