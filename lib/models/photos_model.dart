class PhotoModel {
  int? id;
  int? albumId;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotoModel({
    this.id,
    this.albumId,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'albumId': albumId,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] != null ? json['id'] as int : null,
      albumId: json['albumId'] != null ? json['albumId'] as int : null,
      title: json['title'] != null ? json['title'] as String : null,
      url: json['url'] != null ? json['url'] as String : null,
      thumbnailUrl:
          json['thumbnailUrl'] != null ? json['thumbnailUrl'] as String : null,
    );
  }
}
