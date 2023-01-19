class AlbumModel {
  int? id;
  int? userId;
  String? title;

  AlbumModel({this.id, this.userId, this.title});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
  }
  Map<String, dynamic> toJSON() {
    return {"userId": userId, "id": id, "title": title};
  }
}
