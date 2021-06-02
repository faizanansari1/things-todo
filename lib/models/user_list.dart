class UserList {
  final String title;
  final String description;
  final String category;
  final String timestamp;
  final int priority;
  final String id;
  final bool isCompleted;

  UserList(
      {this.title,
      this.description,
      this.category,
      this.timestamp,
      this.priority,
      this.id,
      this.isCompleted});

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
        id: json['user_id'] as String,
        title: json['title'] as String,
        category: json['category'] as String,
        description: json['description'] as String,
        timestamp: json['timestamp'] as String,
        priority: json['priority'] as int,
        isCompleted: json['isCompleted'] as bool);
  }

  // @override
  // String toString() {
  //   return 'UserList{id: $id, title: $title, description: $description, timestamp: $timestamp, category: $category, priority: $priority, isCompleted: $isCompleted}';
  // }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "category": category,
      "timestamp": timestamp,
      "priority": priority,
      "user_id": id,
      "isCompleted": isCompleted
    };
  }
}
