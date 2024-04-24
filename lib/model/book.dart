final String tableNotes = 'notes';

class BookFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, title, description, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
  static final String cover = 'cover';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;
  final String cover;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
    required this.cover
  });

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
    String? cover
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        cover: cover ?? this.cover
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[BookFields.id] as int?,
        isImportant: json[BookFields.isImportant] == 1,
        number: json[BookFields.number] as int,
        title: json[BookFields.title] as String,
        description: json[BookFields.description] as String,
        createdTime: DateTime.parse(json[BookFields.time] as String),
        cover: json[BookFields.description] as String
      );

  Map<String, Object?> toJson() => {
        BookFields.id: id,
        BookFields.title: title,
        BookFields.isImportant: isImportant ? 1 : 0,
        BookFields.number: number,
        BookFields.description: description,
        BookFields.time: createdTime.toIso8601String(),
        BookFields.cover: cover
      };
}
