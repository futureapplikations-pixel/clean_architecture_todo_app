import 'package:flutter_test/flutter_test.dart';

import 'package:clean_architecture_todo_app/domain/model/todo.dart';

void main() {
  group('Todo Model Tests', () {
    final now = DateTime.now();
    final sampleTodo = Todo(
      id: 1,
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
      dueDate: now,
    );

    test('Todo equality', () {
      final sameTodo = Todo(
        id: 1,
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: false,
        dueDate: now,
      );

      expect(sampleTodo, equals(sameTodo));
      expect(sampleTodo.hashCode, equals(sameTodo.hashCode));
    });

    test('Todo copyWith', () {
      final modifiedTodo = sampleTodo.copyWith(
        title: 'Modified Title',
        isCompleted: true,
      );

      expect(modifiedTodo.id, equals(sampleTodo.id));
      expect(modifiedTodo.title, equals('Modified Title'));
      expect(modifiedTodo.description, equals(sampleTodo.description));
      expect(modifiedTodo.isCompleted, isTrue);
      expect(modifiedTodo.dueDate, equals(sampleTodo.dueDate));
    });

    group('TodosExtension Tests', () {
      final todos = [
        Todo(id: 1, title: 'Todo 1', description: null, isCompleted: true, dueDate: now),
        Todo(id: 2, title: 'Todo 2', description: null, isCompleted: false, dueDate: now),
        Todo(id: 3, title: 'Todo 3', description: null, isCompleted: true, dueDate: now),
        Todo(id: 4, title: 'Todo 4', description: null, isCompleted: false, dueDate: now),
      ];

      test('filterByCompleted', () {
        final completed = todos.filterByCompleted();
        expect(completed.length, equals(2));
        expect(completed.every((todo) => todo.isCompleted), isTrue);
      });

      test('filterByIncomplete', () {
        final incomplete = todos.filterByIncomplete();
        expect(incomplete.length, equals(2));
        expect(incomplete.every((todo) => !todo.isCompleted), isTrue);
      });
    });
  });
}