import 'dart:convert';

import 'package:serv5_task/models/album_model.dart';
import 'package:serv5_task/repositories/albums/album_repository.dart';
import 'package:serv5_task/utils/app_strings.dart';
import 'package:http/http.dart' as http;

class AlbumApi extends AlbumRepository {
  @override
  Future<List<AlbumModel>> getAllAlbums(int pageNumber, int limit) async {
    List<AlbumModel> albums = [];
    final uri = Uri.parse(
      '${AppStrings.baseUrl}${AppStrings.albumEndpoint}?_page=$pageNumber&_limit=$limit',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      albums =
          albums + json.map((album) => AlbumModel.fromJson(album)).toList();
    } else {}
    return albums;
  }
}
