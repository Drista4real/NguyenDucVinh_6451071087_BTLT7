class Task {
  final String id;
  final String title;
  final bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.isDone,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      isDone: json['isDone'] ?? false,
    );
  }
}