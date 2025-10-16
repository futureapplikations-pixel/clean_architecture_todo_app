/// Enum representing different types of scheduled messages
enum MessageType {
  sms('SMS'),
  email('Email'),
  whatsapp('WhatsApp');

  const MessageType(this.displayName);
  final String displayName;
}

/// Domain model for scheduled messages
class ScheduledMessage {
  final int? id;
  final int mementoId;
  final MessageType messageType;
  final String title;
  final String content;
  final DateTime scheduledDateTime;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? sentAt;

  const ScheduledMessage({
    this.id,
    required this.mementoId,
    required this.messageType,
    required this.title,
    required this.content,
    required this.scheduledDateTime,
    this.isActive = true,
    required this.createdAt,
    this.sentAt,
  });

  /// Check if the message is scheduled for the future
  bool get isScheduledForFuture => scheduledDateTime.isAfter(DateTime.now());

  /// Check if the message is due to be sent (within next minute)
  bool get isDue =>
      scheduledDateTime
          .isBefore(DateTime.now().add(const Duration(minutes: 1))) &&
      isActive;

  /// Check if the message has been sent
  bool get isSent => sentAt != null;

  /// Create a copy of this message with updated fields
  ScheduledMessage copyWith({
    int? id,
    int? mementoId,
    MessageType? messageType,
    String? title,
    String? content,
    DateTime? scheduledDateTime,
    bool? isActive,
    DateTime? createdAt,
    DateTime? sentAt,
  }) {
    return ScheduledMessage(
      id: id ?? this.id,
      mementoId: mementoId ?? this.mementoId,
      messageType: messageType ?? this.messageType,
      title: title ?? this.title,
      content: content ?? this.content,
      scheduledDateTime: scheduledDateTime ?? this.scheduledDateTime,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      sentAt: sentAt ?? this.sentAt,
    );
  }

  @override
  String toString() {
    return 'ScheduledMessage(id: $id, title: $title, type: ${messageType.displayName}, scheduled: $scheduledDateTime, active: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScheduledMessage &&
        other.id == id &&
        other.mementoId == mementoId &&
        other.messageType == messageType &&
        other.title == title &&
        other.content == content &&
        other.scheduledDateTime == scheduledDateTime &&
        other.isActive == isActive &&
        other.createdAt == createdAt &&
        other.sentAt == sentAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      mementoId,
      messageType,
      title,
      content,
      scheduledDateTime,
      isActive,
      createdAt,
      sentAt,
    );
  }
}
