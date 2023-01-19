import 'package:serv5_task/models/album_model.dart';

class AlbumController {
  AlbumModel? albumModel;
  AlbumController({this.albumModel});

  get id => albumModel?.id;
  get userId => albumModel?.userId;
  get title => albumModel?.title?.toUpperCase();
}
