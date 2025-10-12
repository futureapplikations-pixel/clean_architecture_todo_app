import 'package:go_router/go_router.dart';

import 'view/memento_form.dart';
import 'view/search_memento_list.dart';
import 'view/memento_details.dart';
import 'view/memento_list.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MementoListPage(),
      routes: [
        GoRoute(
          path: 'memento/:id',
          builder: (context, state) => MementoDetails(id: state.params['id']!),
        ),
        GoRoute(
          path: 'new',
          builder: (context, state) => const MementoFormPage(),
        ),
        GoRoute(
          path: 'search',
          builder: (context, state) => const SearchMementoList(),
        ),
      ],
    ),
  ],
);