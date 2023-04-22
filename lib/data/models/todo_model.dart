const String table = "cached_tasks";

class CachedTaskFields {
  static final List<String> values = [
    /// Add all fields
    id, title, category, createdAt,completed,isN
    // totalPrice
  ];
  static const String id = "_id";
  static const String title = "title";
  static const String category = "category";
  static const String createdAt = "createdAt";
  static const String completed = "completed";
  static const String isN = "isN";
}

class TodoModel {
  String title;
  String category;
  String dateTime;
  int? id;
  int completed;
  int isN;

  TodoModel(
      {required this.title,
      required this.category,
      required this.dateTime,
      required this.completed,
      required this.isN,
      this.id});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json[CachedTaskFields.title] as String,
        category: json[CachedTaskFields.category] as String,
        dateTime: json[CachedTaskFields.createdAt] as String,
        completed: json[CachedTaskFields.completed] as int,
        isN: json[CachedTaskFields.isN] as int,
        id: json[CachedTaskFields.id] as int?);
  }

  Map<String, Object?> toJson() => {
        CachedTaskFields.id: id,
        CachedTaskFields.title: title,
        CachedTaskFields.createdAt: dateTime,
        CachedTaskFields.category: category,
        CachedTaskFields.completed:completed,
        CachedTaskFields.isN:isN
      };

  TodoModel copyWith({
    int? id,
    String? title,
    String? category,
    String? dateTime,
    int? completed,
    int? isN,
  }) =>
      TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        category: category ?? this.category,
        dateTime: dateTime ?? this.dateTime,
        completed: completed ?? this.completed,
        isN: isN ?? this.isN,
      );
}
