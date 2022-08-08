class Todo {
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  Todo(
      {this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked});
  // a SQL database requires us to provide data as a map.
  // sqlite does not support DateTime and Boolean, so we convert them to string and int respectively
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate.toString(),
      'isChecked': isChecked ? 1 : 0
    };
  }
}
