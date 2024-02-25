// Task Model Class
class Task {
  final String title;
  final String description;
  final String date;
  bool isDone;

  Task(
      {required this.title,
      required this.description,
      required this.date,
      required this.isDone});

  // Serialize Task object to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone
    };
  }

  // Deserialize JSON map to Task object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        title: json['title'],
        description: json['description'],
        date: json['date'],
        isDone: json['isDone']);
  }
}
