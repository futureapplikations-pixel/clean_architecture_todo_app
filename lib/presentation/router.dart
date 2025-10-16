import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/model/scheduled_message.dart';
import 'view/developer_options_screen.dart';
import 'view/developer_options_screen.dart';
import 'view/memento_details.dart';
import 'view/memento_list.dart';
import 'view/scheduled_message_form.dart';
import 'view/scheduled_messages_list.dart';
import 'view/search_memento_list.dart';
import 'viewmodel/scheduled_messages_list.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MementoListPage(),
      routes: [
        GoRoute(
          path: 'developer-options',
          builder: (context, state) => const DeveloperOptionsScreen(),
        ),
        GoRoute(
          path: 'memento/:id',
          builder: (context, state) => MementoDetails(id: state.params['id']!),
        ),
        GoRoute(
          path: 'search',
          builder: (context, state) => const SearchMementoList(),
        ),
        GoRoute(
          path: 'scheduled-messages',
          builder: (context, state) => const ScheduledMessagesListView(),
        ),
        GoRoute(
          path: 'scheduled-messages/create/:mementoId',
          builder: (context, state) => ScheduledMessageForm(
            mementoId: int.parse(state.params['mementoId']!),
          ),
        ),
        GoRoute(
          path: 'scheduled-messages/edit/:messageId',
          builder: (context, state) {
            final messageId = int.parse(state.params['messageId']!);
            final message = state.extra as ScheduledMessage?;

            if (message != null) {
              return ScheduledMessageForm(
                  mementoId: message.mementoId, message: message);
            }

            // Fallback if message is not in extra
            return Consumer(builder: (context, ref, child) {
              final messages =
                  ref.watch(scheduledMessagesListViewModelProvider);
              final messageToEdit =
                  messages.firstWhere((element) => element.id == messageId);
              return ScheduledMessageForm(
                  mementoId: messageToEdit.mementoId, message: messageToEdit);
            });
          },
        ),
      ],
    ),
  ],
);
