import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todoform/todo_form.dart';

void main() {
  group('TodoFormViewModel Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state with no todo', () {
      final viewModel = container.read(todoFormViewModelProvider(null).notifier);
      final state = container.read(todoFormViewModelProvider(null));

      expect(viewModel.isNew, isTrue);
      expect(viewModel.isEdited, isFalse);
      expect(state['title'], isNull);
      expect(state['description'], isNull);
      expect(state['isCompleted'], isFalse);
      expect(state['dueDate'], isA<DateTime>());
    });

    test('Initial state with existing todo', () {
      final now = DateTime.now();
      final todo = Todo(
        id: 1,
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: true,
        dueDate: now,
      );

      final viewModel = container.read(todoFormViewModelProvider(todo).notifier);
      final state = container.read(todoFormViewModelProvider(todo));

      expect(viewModel.isNew, isFalse);
      expect(viewModel.isEdited, isFalse);
      expect(state['id'], equals(1));
      expect(state['title'], equals('Test Todo'));
      expect(state['description'], equals('Test Description'));
      expect(state['isCompleted'], isTrue);
      expect(state['dueDate'], equals(now));
    });

    test('Form field updates', () {
      final viewModel = container.read(todoFormViewModelProvider(null).notifier);

      viewModel.setTitle('New Title');
      viewModel.setDescription('New Description');
      final newDate = DateTime.now().add(const Duration(days: 1));
      viewModel.setDueDate(newDate);

      final state = container.read(todoFormViewModelProvider(null));
      expect(state['title'], equals('New Title'));
      expect(state['description'], equals('New Description'));
      expect(state['dueDate'], equals(newDate));
      expect(viewModel.isEdited, isTrue);
    });
  });
}