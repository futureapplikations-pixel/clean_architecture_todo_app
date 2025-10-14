import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/message_statistics_chart.dart';
import '../viewmodel/message_statistics_viewmodel.dart';

class MessagesView extends ConsumerWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(messageStatisticsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Message Statistics',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            const MessageStatisticsChart(),
            const SizedBox(height: 32.0),
            Text(
              'Message Templates',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            // TODO: Add Message Templates List
          ],
        ),
      ),
    );
  }
}
