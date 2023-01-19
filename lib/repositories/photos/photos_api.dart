import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:serv5_task/models/photos_model.dart';
import 'package:serv5_task/repositories/photos/photos_repository.dart';
import 'package:serv5_task/utils/app_strings.dart';

class PhotosApi extends PhotosRepository {
  @override
  Future<List<PhotoModel>> getPhotosByAlbumId(int id) async {
    List<PhotoModel> photos = [];
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
