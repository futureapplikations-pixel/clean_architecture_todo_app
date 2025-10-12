import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/filter_kind.dart';

void main() {
  group('TodoListViewModel Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state', () {
      final state = container.read(todoListViewModelProvider);
      expect(state.isLoading, isTrue);
      expect(state.hasError, isFalse);
      expect(state.value, isNull);
    });

    test('Filter kind updates', () {
      final filterViewModel = container.read(filterKindProvider.notifier);

      // Default should be All
      expect(filterViewModel.isFilteredByAll(), isTrue);
      expect(filterViewModel.isFilteredByCompleted(), isFalse);
      expect(filterViewModel.isFilteredByIncomplete(), isFalse);

      // Change to Completed
      filterViewModel.filterByCompleted();
      expect(filterViewModel.isFilteredByAll(), isFalse);
      expect(filterViewModel.isFilteredByCompleted(), isTrue);
      expect(filterViewModel.isFilteredByIncomplete(), isFalse);

      // Change to Incomplete
      filterViewModel.filterByIncomplete();
      expect(filterViewModel.isFilteredByAll(), isFalse);
      expect(filterViewModel.isFilteredByCompleted(), isFalse);
      expect(filterViewModel.isFilteredByIncomplete(), isTrue);

      // Change back to All
      filterViewModel.filterByAll();
      expect(filterViewModel.isFilteredByAll(), isTrue);
      expect(filterViewModel.isFilteredByCompleted(), isFalse);
      expect(filterViewModel.isFilteredByIncomplete(), isFalse);
    });
  });
}