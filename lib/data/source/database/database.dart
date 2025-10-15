import 'database_impl.dart';
import '../../../domain/model/message_template.dart' as domain;
import '../../../domain/model/user_settings.dart';
import '../../../domain/model/achievement.dart' as domain_achievement;
import '../../../domain/model/quest.dart' as domain_quest;
import '../../../domain/model/leaderboard.dart' as domain_leaderboard;

abstract class Database {
  Future<List<Memento>> searchMementos(String query);
  Future<List<Memento>> getMementos();
  Stream<List<Memento>> watchMementos();
  Future<Memento> insertMemento(MementosCompanion memento);
  Future<void> updateMemento(int id, MementosCompanion memento);
  Future<void> deleteMemento(int id);
  Future<Memento?> getMementoById(int id);
  Future<void> deleteAllMementos();

  // Label operations
  Future<List<Label>> getLabels();
  Future<Label?> getLabelById(int id);
  Future<Label> insertLabel(LabelsCompanion label);
  Future<void> updateLabel(int id, LabelsCompanion label);
  Future<void> deleteLabel(int id);
  Future<List<Label>> getLabelsForMemento(int mementoId);
  Future<void> addLabelToMemento(int mementoId, int labelId);
  Future<void> removeLabelFromMemento(int mementoId, int labelId);

  // Note operations
  Future<List<Note>> getNotes();
  Future<Note?> getNoteById(int id);
  Future<List<Note>> getNotesForMemento(int mementoId);
  Future<Note> insertNote(NotesCompanion note);
  Future<void> updateNote(int id, NotesCompanion note);
  Future<void> deleteNote(int id);

  // Scheduled Message operations
  Future<List<ScheduledMessage>> getScheduledMessages();
  Future<ScheduledMessage?> getScheduledMessageById(int id);
  Future<List<ScheduledMessage>> getScheduledMessagesForMemento(int mementoId);
  Future<List<ScheduledMessage>> getActiveScheduledMessages();
  Future<List<ScheduledMessage>> getDueScheduledMessages(DateTime currentTime);
  Future<ScheduledMessage> insertScheduledMessage(ScheduledMessagesCompanion scheduledMessage);
  Future<void> updateScheduledMessage(int id, ScheduledMessagesCompanion scheduledMessage);
  Future<void> deleteScheduledMessage(int id);
  Future<void> markScheduledMessageAsSent(int id, DateTime sentAt);

  // Message Template operations
  Future<List<MessageTemplate>> getMessageTemplates();
  Future<MessageTemplate?> getMessageTemplateById(int id);
  Future<MessageTemplate> insertMessageTemplate(MessageTemplatesCompanion template);
  Future<void> updateMessageTemplate(int id, MessageTemplatesCompanion template);
  Future<void> deleteMessageTemplate(int id);

  // User Settings operations
  Future<UserSettingsEntity?> getUserSettings();
  Future<void> insertUserSettings(UserSettingsCompanion settings);
  Future<void> updateUserSettings(int id, UserSettingsCompanion settings);
  Future<void> deleteUserSettings(int id);

  // Achievement operations
  Future<List<domain_achievement.Achievement>> getAchievements();
  Future<domain_achievement.Achievement> getAchievementById(String id);
  Future<void> updateAchievement(domain_achievement.Achievement achievement);

  // Quest operations
  Future<List<domain_quest.Quest>> getQuests();
  Future<domain_quest.Quest> getQuestById(String id);
  Future<void> updateQuest(domain_quest.Quest quest);

  // Leaderboard operations
  Future<List<domain_leaderboard.LeaderboardEntry>> getLeaderboard();
}
