import 'package:go_router/go_router.dart';

import 'view/search_memento_list.dart';
import 'view/memento_details.dart';
import 'view/memento_list.dart';
import 'view/scheduled_messages_list.dart';
import 'view/scheduled_message_form.dart';
import 'view/achievements_dashboard.dart';
import 'view/message_template_list_view.dart';
import 'view/messages_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MementoListPage(),
      routes: [
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
            // TODO: Load the message and pass it to the form
            return const ScheduledMessageForm(mementoId: 0);
          },
        ),
        GoRoute(
          path: 'achievements',
          builder: (context, state) => const AchievementsDashboard(),
        ),
        GoRoute(
          path: 'message-templates',
          builder: (context, state) => const MessageTemplateListView(),
        ),
        GoRoute(
          path: 'messages',
          builder: (context, state) => const MessagesView(),
        ),
      ],
    ),
  ],
);
