import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/achievements_viewmodel.dart';
import '../widgets/achievement_card.dart';
import '../widgets/quest_card.dart';
import '../widgets/leaderboard_item.dart';

class AchievementsDashboard extends ConsumerWidget {
  const AchievementsDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(achievementsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: state.when(
        data: (data) => _buildDashboard(context, data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, AchievementsState data) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsOverview(context, data),
          const SizedBox(height: 24),
          _buildSection(context, 'Achievements', data.achievements.map((e) => AchievementCard(achievement: e)).toList()),
          const SizedBox(height: 24),
          _buildSection(context, 'Quests', data.quests.map((e) => QuestCard(quest: e)).toList()),
          const SizedBox(height: 24),
          _buildSection(context, 'Leaderboard', data.leaderboard.asMap().entries.map((e) => LeaderboardItem(entry: e.value, rank: e.key + 1)).toList()),
        ],
      ),
    );
  }

  Widget _buildStatsOverview(BuildContext context, AchievementsState data) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 2,
      children: [
        _buildStatCard(context, 'Achievements', data.achievements.where((e) => e.unlocked).length.toString(), Icons.shield),
        _buildStatCard(context, 'Total Points', data.leaderboard.first.points.toString(), Icons.star),
        _buildStatCard(context, 'Quests Done', data.quests.where((e) => e.completed).length.toString(), Icons.flag),
        _buildStatCard(context, 'Rank', '#1', Icons.leaderboard),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(value, style: Theme.of(context).textTheme.headlineSmall),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}