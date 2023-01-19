import 'package:serv5_task/controllers/album_controller.dart';
import 'package:serv5_task/models/album_model.dart';
import 'package:serv5_task/repositories/albums/album_repository.dart';

class AlbumsController {
  AlbumRepository? albumRepository;
  AlbumsController({this.albumRepository});

  Future<List<AlbumController>> fetchAllAlbums(
      int pageNumber, int limit) async {
    List<AlbumModel> list =
        await albumRepository!.getAllAlbums(pageNumber, limit);
    return list.map((album) => AlbumController(albumModel: album)).toList();
  }
}
