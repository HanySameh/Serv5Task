import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:serv5_task/controllers/photos_controller.dart';
import 'package:serv5_task/repositories/photos/photos_api.dart';

class AlbumListItem extends StatelessWidget {
  AlbumListItem({
    super.key,
    required this.albumTitle,
    required this.id,
  });

  final String albumTitle;
  final int id;
  final PhotosController _photosController =
      PhotosController(photosRepository: PhotosApi());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () async {
        debugPrint(id.toString());
        Scaffold.of(context).showBottomSheet<void>(
          (BuildContext context) {
            return Container(
              height: screenHeight * 0.85,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight / 40,
                horizontal: screenWidth * 0.07,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Album Photos',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.06,
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: _photosController.fetchAlbumPhotos(id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: LoadingAnimationWidget.stretchedDots(
                                color: Colors.black,
                                size: 70,
                              ),
                            );
                          } else {
                            var photos = snapshot.data;
                            return GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                              ),
                              itemCount: photos?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: screenHeight * 0.1,
                                  width: screenWidth * 0.4,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(
                                    photos![index].thumbnailUrl!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return const Center(
                                        child: Text(
                                          'Not Available',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: screenWidth / 29),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: screenWidth / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            albumTitle,
            style: const TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
