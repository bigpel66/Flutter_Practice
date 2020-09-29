class UserFeedback {
  final String id;
  final String userId;
  final String title;
  final String details;
  final String note;
  final bool open;
  final bool read;
  final int type;

  UserFeedback({
    this.id,
    this.userId,
    this.title,
    this.details,
    this.note,
    this.open,
    this.read,
    this.type,
  });

  UserFeedback.fromData(Map<String, dynamic> data)
      : id = data['id'],
        userId = data['userId'],
        title = data['title'],
        details = data['details'],
        note = data['note'],
        open = data['open'] ?? true,
        read = data['read'] ?? false,
        type = data['type'] ?? 0;
}
