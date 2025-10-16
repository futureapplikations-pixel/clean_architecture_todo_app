import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/achievement.dart';
import '../../domain/service/achievement_service.dart';
import '../theme.dart';
import '../widgets/achievement_card.dart';

final achievementServiceProvider = Provider<AchievementService>((ref) {
  return AchievementServiceImpl();
});

final allAchievementsProvider = FutureProvider<List<Achievement>>((ref) {
  final service = ref.watch(achievementServiceProvider);
  return service.getAllAchievements();
});

final unlockedAchievementsProvider = FutureProvider<List<Achievement>>((ref) {
  final service = ref.watch(achievementServiceProvider);
  return service.getUnlockedAchievements();
});

final totalPointsProvider = FutureProvider<int>((ref) {
  final service = ref.watch(achievementServiceProvider);
  return service.getTotalPoints();
});

class AchievementDashboard extends ConsumerStatefulWidget {
  const AchievementDashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<AchievementDashboard> createState() =>
      _AchievementDashboardState();
}

class _AchievementDashboardState extends ConsumerState<AchievementDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Achievements',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontFamily: 'Playfair Display',
            color: theme.colorScheme.onSurface,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              // Stats Overview
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.softGold.withOpacity(0.1),
                      AppTheme.sageGreen.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.softGold.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard(
                      'Total Points',
                      ref.watch(totalPointsProvider).when(
                            data: (points) => points.toString(),
                            loading: () => '...',
                            error: (_, __) => '0',
                          ),
                      Icons.stars,
                      AppTheme.softGold,
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: theme.colorScheme.outline.withOpacity(0.3),
                    ),
                    _buildStatCard(
                      'Unlocked',
                      ref.watch(unlockedAchievementsProvider).when(
                            data: (achievements) =>
                                achievements.length.toString(),
                            loading: () => '...',
                            error: (_, __) => '0',
                          ),
                      Icons.emoji_events,
                      AppTheme.sageGreen,
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: theme.colorScheme.outline.withOpacity(0.3),
                    ),
                    _buildStatCard(
                      'Total',
                      ref.watch(allAchievementsProvider).when(
                            data: (achievements) =>
                                achievements.length.toString(),
                            loading: () => '...',
                            error: (_, __) => '0',
                          ),
                      Icons.workspace_premium,
                      AppTheme.warmCharcoal,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Tab Bar
              TabBar(
                controller: _tabController,
                indicatorColor: AppTheme.softGold,
                labelColor: AppTheme.warmCharcoal,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                labelStyle: theme.textTheme.titleMedium?.copyWith(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Unlocked'),
                  Tab(text: 'Social'),
                  Tab(text: 'Progress'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAllAchievementsTab(),
          _buildUnlockedAchievementsTab(),
          _buildCategoryTab(AchievementCategory.social),
          _buildProgressTab(),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                color: color,
              ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'Inter',
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }

  Widget _buildAllAchievementsTab() {
    return ref.watch(allAchievementsProvider).when(
          data: (achievements) => _buildAchievementGrid(achievements),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(
              'Error loading achievements: $error',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
        );
  }

  Widget _buildUnlockedAchievementsTab() {
    return ref.watch(unlockedAchievementsProvider).when(
          data: (achievements) => achievements.isEmpty
              ? _buildEmptyState('No achievements unlocked yet',
                  'Complete tasks to unlock your first achievement!')
              : _buildAchievementGrid(achievements),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(
              'Error loading achievements: $error',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
        );
  }

  Widget _buildCategoryTab(AchievementCategory category) {
    return ref.watch(allAchievementsProvider).when(
          data: (achievements) {
            final categoryAchievements = achievements
                .where((achievement) => achievement.category == category)
                .toList();
            return categoryAchievements.isEmpty
                ? _buildEmptyState('No achievements in this category',
                    'Check back later for new achievements!')
                : _buildAchievementGrid(categoryAchievements);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(
              'Error loading achievements: $error',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
        );
  }

  Widget _buildProgressTab() {
    return ref.watch(allAchievementsProvider).when(
          data: (achievements) {
            final inProgressAchievements = achievements
                .where((achievement) =>
                    !achievement.isUnlocked && achievement.progress > 0)
                .toList();

            return inProgressAchievements.isEmpty
                ? _buildEmptyState('No achievements in progress',
                    'Start completing tasks to see progress here!')
                : _buildAchievementGrid(inProgressAchievements);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(
              'Error loading achievements: $error',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
        );
  }

  Widget _buildAchievementGrid(List<Achievement> achievements) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        return AchievementCard(achievement: achievements[index]);
      },
    );
  }

  Widget _buildEmptyState(String title, String subtitle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontFamily: 'Inter',
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'Inter',
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
