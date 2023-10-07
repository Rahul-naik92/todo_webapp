class Task {
  int? id;
  String? title;
  bool isDone = false;

  Task({
    // this.id,
    this.title,
    this.isDone = false,
  });
//Json to map
  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDone = json['isDone'];
  }

  //map to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['title'] = title;
    data['isDone'] = isDone;
    return data;
  }
}
