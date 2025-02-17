class TodoModel {
  String title;
  String desc;
  bool done;
  TodoModel({
    required this.title,
    required this.desc,
    this.done =false,
  });
}
