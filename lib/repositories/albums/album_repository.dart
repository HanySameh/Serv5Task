import 'package:serv5_task/models/album_model.dart';

abstract class AlbumRepository {
  Future<List<AlbumModel>> getAllAlbums(int pageNumber, int limit);
}
