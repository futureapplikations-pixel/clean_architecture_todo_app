import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/model/achievement.dart';
import '../theme.dart';

class AchievementCard extends StatefulWidget {
  const AchievementCard({
    Key? key,
    required this.achievement,
    this.onTap,
  }) : super(key: key);

  final Achievement achievement;
  final VoidCallback? onTap;

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _tapController;
  late AnimationController _celebrationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _bounceAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _tapController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _celebrationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _tapController,
      curve: Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 4.0,
      end: 12.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 0.4,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _celebrationController,
      curve: Curves.elasticOut,
    ));

    if (widget.achievement.isUnlocked) {
      _celebrationController.forward();
    }
  }

  @override
  void didUpdateWidget(AchievementCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.achievement.isUnlocked && !oldWidget.achievement.isUnlocked) {
      _celebrationController.forward(from: 0.0);
      HapticFeedback.heavyImpact();
    }
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _tapController.dispose();
    _celebrationController.dispose();
    super.dispose();
  }

  void _onHoverChanged(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });

    if (isHovered) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  void _onTapDown(TapDownDetails details) {
    _tapController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _tapController.reverse();
  }

  void _onTapCancel() {
    _tapController.reverse();
  }

  Color _getRarityColor(AchievementRarity rarity) {
    switch (rarity) {
      case AchievementRarity.common:
        return AppTheme.warmCharcoal;
      case AchievementRarity.rare:
        return AppTheme.softGold;
      case AchievementRarity.epic:
        return AppTheme.sageGreen;
      case AchievementRarity.legendary:
        return Colors.purple;
    }
  }

  Color _getRarityBgColor(AchievementRarity rarity) {
    switch (rarity) {
      case AchievementRarity.common:
        return AppTheme.warmCharcoal.withOpacity(0.1);
      case AchievementRarity.rare:
        return AppTheme.softGold.withOpacity(0.1);
      case AchievementRarity.epic:
        return AppTheme.sageGreen.withOpacity(0.1);
      case AchievementRarity.legendary:
        return Colors.purple.withOpacity(0.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rarityColor = _getRarityColor(widget.achievement.rarity);
    final rarityBgColor = _getRarityBgColor(widget.achievement.rarity);

    return AnimatedBuilder(
      animation: Listenable.merge([
        _hoverController,
        _tapController,
        _celebrationController,
      ]),
      builder: (context, child) {
        return Transform.scale(
          scale:
              _scaleAnimation.value * (1.0 + (_bounceAnimation.value * 0.05)),
          child: Card(
            elevation: _elevationAnimation.value,
            shadowColor: widget.achievement.isUnlocked
                ? rarityColor.withOpacity(_glowAnimation.value)
                : theme.shadowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: widget.achievement.isUnlocked
                    ? rarityColor.withOpacity(0.3)
                    : theme.colorScheme.outline.withOpacity(0.3),
                width: widget.achievement.isUnlocked ? 2 : 1,
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.achievement.isUnlocked
                        ? rarityBgColor
                        : theme.colorScheme.surface,
                    theme.colorScheme.surface.withOpacity(0.95),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  onTapCancel: _onTapCancel,
                  onHover: _onHoverChanged,
                  borderRadius: BorderRadius.circular(20),
                  splashColor: rarityColor.withOpacity(0.1),
                  highlightColor: rarityColor.withOpacity(0.05),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Achievement Icon and Rarity Indicator
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: widget.achievement.isUnlocked
                                    ? rarityColor.withOpacity(0.1)
                                    : theme.colorScheme.surfaceVariant
                                        .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: widget.achievement.isUnlocked
                                      ? rarityColor.withOpacity(0.3)
                                      : theme.colorScheme.outline
                                          .withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  widget.achievement.icon,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                            if (widget.achievement.isUnlocked)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: rarityColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: rarityColor.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  widget.achievement.rarity.name.toUpperCase(),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: rarityColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Achievement Name
                        Text(
                          widget.achievement.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: widget.achievement.isUnlocked
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.onSurfaceVariant,
                            fontFamily: 'Inter',
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // Achievement Description
                        Text(
                          widget.achievement.description,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontFamily: 'Inter',
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),

                        // Progress Section
                        if (!widget.achievement.isUnlocked) ...[
                          // Progress Bar
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceVariant
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor:
                                  widget.achievement.progressPercentage / 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppTheme.softGold,
                                      AppTheme.sageGreen,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Progress Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.achievement.progress}/${widget.achievement.maxProgress}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              Text(
                                '${widget.achievement.progressPercentage.toStringAsFixed(0)}%',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppTheme.softGold,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          // Unlocked Achievement
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: rarityColor,
                                size: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Unlocked',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: rarityColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${widget.achievement.points} pts',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: rarityColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
