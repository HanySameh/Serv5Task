import 'package:serv5_task/models/photos_model.dart';
import 'package:serv5_task/repositories/photos/photos_repository.dart';

class PhotosController {
  PhotosRepository? photosRepository;
  PhotosController({this.photosRepository});

  Future<List<PhotoModel>> fetchAlbumPhotos(int id) async {
    List<PhotoModel> list = await photosRepository!.getPhotosByAlbumId(id);
    return list;
  }
}
