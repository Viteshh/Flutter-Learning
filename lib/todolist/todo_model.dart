class Note {
  final int? id;
  final String title;
  final String description;

  const Note({required this.title, required this.description, this.id});

  factory Note.fromMap(Map<String, dynamic> res) =>
      Note(id: res['id'], title: res['title'], description: res['description']);

  Map<String, dynamic> toMap() =>
      {'id': id, 'title': title, 'description': description};
}
