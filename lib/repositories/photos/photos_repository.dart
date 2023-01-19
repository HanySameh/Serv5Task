import 'package:serv5_task/models/photos_model.dart';

abstract class PhotosRepository {
  Future<List<PhotoModel>> getPhotosByAlbumId(int id);
}
