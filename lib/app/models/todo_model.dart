class TodoModel {
  late int? userId;
  late int? id;
  late String? title;
  late bool? completed;

  TodoModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  TodoModel.fromJson(Map<String, dynamic> json) { 
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}