import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'connection/connection.dart' as impl;
import 'database.dart';

part 'database_impl.g.dart';

typedef Val<T> = Value<T>;

final databaseProvider = Provider<Database>(
  (ref) => DatabaseImpl(
    dbName: 'database.db',
    inMemory: false,
    logStatements: false,
  ),
);

@DriftDatabase(include: {'sql/schema.drift'})
class DatabaseImpl extends _$DatabaseImpl implements Database {
  DatabaseImpl({
    required this.dbName,
    required this.inMemory,
    required this.logStatements,
  }) : super.connect(impl.connect(
          dbName,
          inMemory: inMemory,
          logStatements: logStatements,
        ));

  final String dbName;
  final bool inMemory;
  final bool logStatements;

  @override
  int get schemaVersion => 1;

  @override
  Future<void> onCreate(Migrator migrator) async {
    await super.onCreate(migrator);
    // Insert initial achievements
    await batch((batch) {
      batch.insertAll(achievements, [
        AchievementsCompanion.insert(
          id: 'first-connection',
          name: 'First Connection',
          description: 'Add your first memento',
          icon: '🔗',
          category: 'connections',
          points: 50,
          unlocked: Value(0),
          progress: Value(0.0),
          requirement: 1,
          currentProgress: Value(0),
        ),
        AchievementsCompanion.insert(
          id: 'network-builder',
          name: 'Network Builder',
          description: 'Add 10 mementos',
          icon: '🌐',
          category: 'connections',
          points: 100,
          unlocked: 0,
          progress: 0.0,
          requirement: 10,
          currentProgress: 0,
        ),
        AchievementsCompanion.insert(
          id: 'connection-master',
          name: 'Connection Master',
          description: 'Add 25 mementos',
          icon: '👥',
          category: 'connections',
          points: 200,
          unlocked: 0,
          progress: 0.0,
          requirement: 25,
          currentProgress: 0,
        ),
        AchievementsCompanion.insert(
          id: 'social-butterfly',
          name: 'Social Butterfly',
          description: 'Add 50 mementos',
          icon: '🦋',
          category: 'connections',
          points: 300,
          unlocked: 0,
          progress: 0.0,
          requirement: 50,
          currentProgress: 0,
        ),
        AchievementsCompanion.insert(
          id: 'note-taker',
          name: 'Note Taker',
          description: 'Add your first note',
          icon: '📝',
          category: 'engagement',
          points: 50,
          unlocked: 0,
          progress: 0.0,
          requirement: 1,
          currentProgress: 0,
        ),
        AchievementsCompanion.insert(
          id: 'memory-keeper',
          name: 'Memory Keeper',
          description: 'Add 50 notes',
          icon: '📚',
          category: 'engagement',
          points: 150,
          unlocked: 0,
          progress: 0.0,
          requirement: 50,
          currentProgress: 0,
        ),
        AchievementsCompanion.insert(
          id: 'communication-expert',
          name: 'Communication Expert',
          description: 'Send 25 messages',
          icon: '📧',
          category: 'engagement',
          points: 150,
          unlocked: 0,
          progress: 0.0,
          requirement: 25,
          currentProgress: 0,
        ),
        AchievementsCompanion.insert(
          id: 'consistent-connector',
          name: 'Consistent Connector',
          description: 'Maintain a 7-day streak',
          icon: '🔥',
          category: 'engagement',
          points: 200,
          unlocked: 0,
          progress: 0.0,
          requirement: 7,
          currentProgress: 0,
        ),
        AchievementsCompanion.insert(
          id: 'relationship-architect',
          name: 'Relationship Architect',
          description: 'Add notes to 20 different mementos',
          icon: '🏗️',
          category: 'engagement',
          points: 250,
          unlocked: 0,
          progress: 0.0,
          requirement: 20,
          currentProgress: 0,
        ),
        AchievementsCompanion.insert(
          id: 'master-networker',
          name: 'Master Networker',
          description: 'Reach 1000 total points',
          icon: '⭐',
          category: 'connections',
          points: 500,
          unlocked: 0,
          progress: 0.0,
          requirement: 1000,
          currentProgress: 0,
        ),
      ]);

      // Insert initial quests
      batch.insertAll(quests, [
        QuestsCompanion.insert(
          id: 'quest1',
          name: 'Daily Connector',
          description: 'Add one new note today',
          points: 25,
          completed: 0,
          progress: 0.0,
          requirement: 1,
        ),
        QuestsCompanion.insert(
          id: 'quest2',
          name: 'Network Maintainer',
          description: 'Review 3 memento profiles',
          points: 30,
          completed: 0,
          progress: 0.0,
          requirement: 3,
        ),
        QuestsCompanion.insert(
          id: 'quest3',
          name: 'Message Scheduler',
          description: 'Schedule a message for tomorrow',
          points: 40,
          completed: 0,
          progress: 0.0,
          requirement: 1,
        ),
      ]);

      // Insert initial leaderboard entries
      batch.insertAll(leaderboard, [
        LeaderboardCompanion.insert(
          userId: 'user',
          name: 'You',
          points: 0,
          level: 1,
        ),
        LeaderboardCompanion.insert(
          userId: 'alex-chen',
          name: 'Alex Chen',
          points: 1180,
          level: 5,
        ),
        LeaderboardCompanion.insert(
          userId: 'sarah-kim',
          name: 'Sarah Kim',
          points: 950,
          level: 4,
        ),
      ]);

      // Insert initial message templates
      batch.insertAll(messageTemplates, [
        MessageTemplatesCompanion.insert(
          name: 'Follow-up Meeting',
          content: 'Hi {name}, it was great meeting you at {event}. I\'d love to continue our conversation about {topic}. Would you be available for a quick call this week?',
          category: 'networking',
        ),
        MessageTemplatesCompanion.insert(
          name: 'Birthday Wishes',
          content: 'Happy Birthday, {name}! Wishing you a wonderful day filled with joy and celebration. Hope this year brings you lots of happiness and success.',
          category: 'personal',
        ),
        MessageTemplatesCompanion.insert(
          name: 'Thank You Note',
          content: 'Hi {name}, I wanted to thank you for {reason}. Your help and support meant a lot to me. Looking forward to staying in touch!',
          category: 'professional',
        ),
      ]);

      // Insert initial user settings
      batch.insertAll(userSettings, [
        UserSettingsCompanion.insert(
          displayName: 'Memento User',
          email: 'user@memento.app',
          timezone: 'UTC',
          dateFormat: 'mmddyyyy',
          theme: 'light',
          accentColor: 0xFF87A96B, // Sage Green
          messageReminders: 1,
          birthdayReminders: 1,
          achievementNotifications: 1,
          dailyQuests: 1,
          dataEncryption: 1,
          analytics: 0,
          autoLock: 0,
        ),
      ]);
    });
  }

  @override
  Stream<List<Memento>> watchMementos() => _getMementos().watch();

  @override
  Future<List<Memento>> getMementos() => _getMementos().get();

  @override
  Future<Memento?> getMementoById(int id) => _getMementoById(id).getSingleOrNull();

  @override
  Future<void> deleteMemento(int id) => _deleteMemento(id);

  @override
  Future<Memento> insertMemento(MementosCompanion memento) async {
    final id = await _insertMemento(
      memento.name.value,
      memento.photo.value,
      memento.email.value,
      memento.phone.value,
      memento.context.value,
      memento.jobTitle.value,
      memento.company.value,
      memento.birthday.value,
    );
    return _getMementoById(id).getSingle();
  }

  @override
  Future<void> updateMemento(int id, MementosCompanion memento) async {
    return transaction(() {
      return _updateMemento(
        memento.name.value,
        memento.photo.value,
        memento.email.value,
        memento.phone.value,
        memento.context.value,
        memento.jobTitle.value,
        memento.company.value,
        memento.birthday.value,
        id,
      );
    });
  }

  @override
  Future<void> deleteAllMementos() {
    return transaction(() {
      return _deleteAllMementos();
    });
  }

  @override
  Future<List<Memento>> searchMementos(String query) {
    return _searchMementos(query).get().then((value) => value.map((e) => e.result).toList());
  }

  // Label operations
  @override
  Future<List<Label>> getLabels() => _getLabels().get();

  @override
  Future<Label?> getLabelById(int id) => _getLabelById(id).getSingleOrNull();

  @override
  Future<Label> insertLabel(LabelsCompanion label) async {
    final id = await _insertLabel(
      label.name.value,
      label.color.value,
    );
    return _getLabelById(id).getSingle();
  }

  @override
  Future<void> updateLabel(int id, LabelsCompanion label) async {
    await _updateLabel(
      label.name.value,
      label.color.value,
      id,
    );
  }

  @override
  Future<void> deleteLabel(int id) => _deleteLabel(id);

  @override
  Future<List<Label>> getLabelsForMemento(int mementoId) {
    return _getLabelsForMemento(mementoId).get();
  }

  @override
  Future<void> addLabelToMemento(int mementoId, int labelId) {
    return _addLabelToMemento(mementoId, labelId);
  }

  @override
  Future<void> removeLabelFromMemento(int mementoId, int labelId) {
    return _removeLabelFromMemento(mementoId, labelId);
  }

  // Note operations
  @override
  Future<List<Note>> getNotes() => _getNotes().get();

  @override
  Future<Note?> getNoteById(int id) => _getNoteById(id).getSingleOrNull();

  @override
  Future<List<Note>> getNotesForMemento(int mementoId) {
    return _getNotesForMemento(mementoId).get();
  }

  @override
  Future<Note> insertNote(NotesCompanion note) async {
    final id = await _insertNote(
      note.mementoId.value,
      note.content.value,
      note.createdAt.value,
      note.updatedAt.value,
      note.isFavorite.value,
    );
    return _getNoteById(id).getSingle();
  }

  @override
  Future<void> updateNote(int id, NotesCompanion note) async {
    await _updateNote(
      note.content.value,
      note.updatedAt.value,
      note.isFavorite.value,
      id,
    );
  }

  @override
  Future<void> deleteNote(int id) => _deleteNote(id);

  // Scheduled Message operations
  @override
  Future<List<ScheduledMessage>> getScheduledMessages() => _getScheduledMessages().get();

  @override
  Future<ScheduledMessage?> getScheduledMessageById(int id) => _getScheduledMessageById(id).getSingleOrNull();

  @override
  Future<List<ScheduledMessage>> getScheduledMessagesForMemento(int mementoId) {
    return _getScheduledMessagesForMemento(mementoId).get();
  }

  @override
  Future<List<ScheduledMessage>> getActiveScheduledMessages() {
    return _getActiveScheduledMessages().get();
  }

  @override
  Future<List<ScheduledMessage>> getDueScheduledMessages(DateTime currentTime) {
    return _getDueScheduledMessages(currentTime.millisecondsSinceEpoch).get();
  }

  @override
  Future<ScheduledMessage> insertScheduledMessage(ScheduledMessagesCompanion scheduledMessage) async {
    final id = await _insertScheduledMessage(
      scheduledMessage.mementoId.value,
      scheduledMessage.messageType.value,
      scheduledMessage.title.value,
      scheduledMessage.content.value,
      scheduledMessage.scheduledDateTime.value,
      scheduledMessage.isActive.value,
      scheduledMessage.createdAt.value,
      scheduledMessage.sentAt.value,
    );
    return _getScheduledMessageById(id).getSingle();
  }

  @override
  Future<void> updateScheduledMessage(int id, ScheduledMessagesCompanion scheduledMessage) async {
    await _updateScheduledMessage(
      scheduledMessage.mementoId.value,
      scheduledMessage.messageType.value,
      scheduledMessage.title.value,
      scheduledMessage.content.value,
      scheduledMessage.scheduledDateTime.value,
      scheduledMessage.isActive.value,
      scheduledMessage.sentAt.value,
      id,
    );
  }

  @override
  Future<void> deleteScheduledMessage(int id) => _deleteScheduledMessage(id);

  @override
  Future<void> markScheduledMessageAsSent(int id, DateTime sentAt) {
    return _markScheduledMessageAsSent(sentAt.millisecondsSinceEpoch, id);
  }

  // Achievement operations
  @override
  Future<List<Achievement>> getAchievements() async {
    final entities = await _getAchievements().get();
    return entities.map((e) => Achievement(
      id: e.id,
      name: e.name,
      description: e.description,
      icon: e.icon,
      category: e.category,
      points: e.points,
      unlocked: e.unlocked == 1,
      unlockedDate: e.unlockedDate != null ? DateTime.fromMillisecondsSinceEpoch(e.unlockedDate!) : null,
      progress: e.progress,
      requirement: e.requirement,
      currentProgress: e.currentProgress,
    )).toList();
  }

  @override
  Future<Achievement> getAchievementById(String id) async {
    final entity = await _getAchievementById(id).getSingle();
    return Achievement(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      icon: entity.icon,
      category: entity.category,
      points: entity.points,
      unlocked: entity.unlocked,
      unlockedDate: entity.unlockedDate != null ? DateTime.fromMillisecondsSinceEpoch(entity.unlockedDate!) : null,
      progress: entity.progress,
      requirement: entity.requirement,
      current: entity.currentProgress,
    );
  }

  @override
  Future<void> updateAchievement(Achievement achievement) async {
    await _updateAchievement(
      achievement.id,
      achievement.name,
      achievement.description,
      achievement.icon,
      achievement.category,
      achievement.points,
      achievement.unlocked,
      achievement.unlockedDate?.millisecondsSinceEpoch,
      achievement.progress,
      achievement.requirement,
      achievement.current,
    );
  }

  // Quest operations
  @override
  Future<List<Quest>> getQuests() async {
    final entities = await _getQuests().get();
    return entities.map((e) => Quest(
      id: e.id,
      name: e.name,
      description: e.description,
      points: e.points,
      completed: e.completed,
      progress: e.progress,
      requirement: e.requirement,
    )).toList();
  }

  @override
  Future<Quest> getQuestById(String id) async {
    final entity = await _getQuestById(id).getSingle();
    return Quest(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      points: entity.points,
      completed: entity.completed,
      progress: entity.progress,
      requirement: entity.requirement,
    );
  }

  @override
  Future<void> updateQuest(Quest quest) async {
    await _updateQuest(
      quest.id,
      quest.name,
      quest.description,
      quest.points,
      quest.completed,
      quest.progress,
      quest.requirement,
    );
  }

  // Leaderboard operations
  @override
  Future<List<LeaderboardEntry>> getLeaderboard() async {
    final entities = await _getLeaderboard().get();
    return entities.map((e) => LeaderboardEntry(
      name: e.name,
      points: e.points,
      level: e.level,
      isUser: e.userId == 'user',
    )).toList();
  }

  // Message Template operations
  @override
  Future<List<MessageTemplate>> getMessageTemplates() async {
    final entities = await _getMessageTemplates().get();
    return entities.map((e) => MessageTemplate(
      id: e.id,
      name: e.name,
      content: e.content,
      category: e.category,
    )).toList();
  }

  @override
  Future<MessageTemplate?> getMessageTemplateById(int id) async {
    final entity = await _getMessageTemplateById(id).getSingleOrNull();
    if (entity == null) {
      return null;
    }
    return MessageTemplate(
      id: entity.id,
      name: entity.name,
      content: entity.content,
      category: entity.category,
    );
  }

  @override
  Future<MessageTemplate> insertMessageTemplate(MessageTemplatesCompanion template) async {
    final id = await _insertMessageTemplate(
      template.name.value,
      template.content.value,
      template.category.value,
    );
    final entity = await _getMessageTemplateById(id).getSingle();
    return MessageTemplate(
      id: entity.id,
      name: entity.name,
      content: entity.content,
      category: entity.category,
    );
  }

  @override
  Future<void> updateMessageTemplate(int id, MessageTemplatesCompanion template) async {
    await _updateMessageTemplate(
      template.name.value,
      template.content.value,
      template.category.value,
      id,
    );
  }

  @override
  Future<void> deleteMessageTemplate(int id) {
    return _deleteMessageTemplate(id);
  }

  // User Settings operations
  @override
  Future<UserSettingsEntity?> getUserSettings() {
    return _getUserSettings().getSingleOrNull();
  }

  @override
  Future<void> insertUserSettings(UserSettingsCompanion settings) {
    return _insertUserSettings(
      settings.displayName.value,
      settings.email.value,
      settings.timezone.value,
      settings.dateFormat.value,
      settings.theme.value,
      settings.accentColor.value,
      settings.messageReminders.value,
      settings.birthdayReminders.value,
      settings.achievementNotifications.value,
      settings.dailyQuests.value,
      settings.dataEncryption.value,
      settings.analytics.value,
      settings.autoLock.value,
    );
  }

  @override
  Future<void> updateUserSettings(int id, UserSettingsCompanion settings) {
    return _updateUserSettings(
      settings.displayName.value,
      settings.email.value,
      settings.timezone.value,
      settings.dateFormat.value,
      settings.theme.value,
      settings.accentColor.value,
      settings.messageReminders.value,
      settings.birthdayReminders.value,
      settings.achievementNotifications.value,
      settings.dailyQuests.value,
      settings.dataEncryption.value,
      settings.analytics.value,
      settings.autoLock.value,
      id,
    );
  }

  @override
  Future<void> deleteUserSettings(int id) {
    return _deleteUserSettings(id);
  }
}
