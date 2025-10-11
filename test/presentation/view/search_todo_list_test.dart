import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/presentation/view/search_todo_list.dart';
import 'package:clean_architecture_todo_app/data/repository/todos_impl.dart';

final mockTodos = [
  Todo(
    id: 1,
    title: 'Meeting with Team',
    description: 'Discuss project status',
    isCompleted: false,
    dueDate: DateTime(2025, 10, 12),
  ),
  Todo(
    id: 2,
    title: 'Project Review',
    description: 'Team meeting for review',
    isCompleted: true,
    dueDate: DateTime(2025, 10, 13),
  ),
];

class MockTodosRepository extends TodosRepositoryImpl {
  @override
  Future<List<Todo>> searchTodos(String query) async {
    if (query.isEmpty) return [];
    return mockTodos.where((todo) =>
      todo.title.toLowerCase().contains(query.toLowerCase()) ||
      (todo.description?.toLowerCase() ?? '').contains(query.toLowerCase())
    ).toList();
  }
}

void main() {
  group('SearchTodoList Widget Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(
        overrides: [
          todosRepositoryImplProvider
              .overrideWith(() => MockTodosRepository()),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    Widget buildSearchScreen() {
      return ProviderScope(
        parent: container,
        child: const MaterialApp(
          home: SearchTodoList(),
        ),
      );
    }

    testWidgets('Shows search field and handles input', (tester) async {
      await tester.pumpWidget(buildSearchScreen());

      // Verify search field exists
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search TODO'), findsOneWidget);

      // Enter search text
      await tester.enterText(find.byType(TextField), 'meeting');
      await tester.pump();

      // Wait for async operations
      await tester.pumpAndSettle();

      // Verify filtered results
      expect(find.text('Meeting with Team'), findsOneWidget);
      expect(find.text('Discuss project status'), findsOneWidget);
      expect(find.text('Project Review'), findsNothing);
    });

    testWidgets('Shows "No TODO found" when no results', (tester) async {
      await tester.pumpWidget(buildSearchScreen());

      // Enter search text
      await tester.enterText(find.byType(TextField), 'nonexistent');
      await tester.pump();

      // Wait for async operations
      await tester.pumpAndSettle();

      // Verify empty state message
      expect(find.text('No TODO found'), findsOneWidget);
    });

    testWidgets('Shows loading state', (tester) async {
      await tester.pumpWidget(buildSearchScreen());

      // Enter search text
      await tester.enterText(find.byType(TextField), 'test');
      await tester.pump();

      // Verify loading indicator before settling
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}