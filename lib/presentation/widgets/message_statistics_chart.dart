import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/scheduled_message.dart';
import '../viewmodel/message_statistics_viewmodel.dart';

class MessageStatisticsChart extends ConsumerWidget {
  const MessageStatisticsChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(messageStatisticsViewModelProvider);

    return statsAsync.when(
      data: (stats) => _buildChart(context, stats),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error loading chart: $error')),
    );
  }

  Widget _buildChart(BuildContext context, MessageStatisticsState stats) {
    final theme = Theme.of(context);

    List<BarChartGroupData> barGroups = [];
    int i = 0;
    for (final type in MessageType.values) {
      barGroups.add(BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: stats.sentByType[type]?.toDouble() ?? 0,
            color: theme.colorScheme.primary,
            width: 16,
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: stats.scheduledByType[type]?.toDouble() ?? 0,
            color: theme.colorScheme.secondary,
            width: 16,
            borderRadius: BorderRadius.zero,
          ),
        ],
        showingTooltipIndicators: [0, 1],
      ));
      i++;
    }

    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          barGroups: barGroups,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text(MessageType.sms.displayName, style: theme.textTheme.labelSmall);
                    case 1:
                      return Text(MessageType.email.displayName, style: theme.textTheme.labelSmall);
                    case 2:
                      return Text(MessageType.whatsapp.displayName, style: theme.textTheme.labelSmall);
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().toString(), style: theme.textTheme.labelSmall);
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          gridData: const FlGridData(show: false),
        ),
      ),
    );
  }
}
