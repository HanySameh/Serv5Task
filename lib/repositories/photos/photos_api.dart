import 'dart:convert';

import 'package:serv5_task/models/album_model.dart';
import 'package:serv5_task/models/photos_model.dart';
import 'package:serv5_task/repositories/albums/album_repository.dart';
import 'package:serv5_task/repositories/photos/photos_repository.dart';
import 'package:serv5_task/utils/app_strings.dart';
import 'package:http/http.dart' as http;

class PhotosApi extends PhotosRepository {
  @override
  Future<List<PhotoModel>> getPhotosByAlbumId(int id) async {
    List<PhotoModel> photos = [];
    // try {
    //   Response response = await Dio().get(
    //       '${AppStrings.baseUrl}${AppStrings.albumEndpoint}?page=$pageNumber&per_page=$limit');
    //   List list = response.data;
    //   albums = list.map((post) => AlbumModel.fromJson(post)).toList();

    // } catch (exception) {
    //   debugPrint(exception.toString());
    // }
    // debugPrint(albums.toString());
    final uri = Uri.parse(
      '${AppStrings.baseUrl}${AppStrings.albumEndpoint}/$id/${AppStrings.photosEndpoint}',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      photos =
          photos + json.map((album) => PhotoModel.fromJson(album)).toList();
    } else {}
    return photos;
  }
}
