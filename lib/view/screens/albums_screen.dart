import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:serv5_task/repositories/albums/album_api.dart';

import '../../controllers/albums_controller.dart';
import '../widgets/album_list_item.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  final albumsController = AlbumsController(albumRepository: AlbumApi());
  late ScrollController _scrollController;
  bool _isLoading = false;
  List _items = [];
  int _page = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _fetchItems();
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchItems();
    }
  }

  Future<void> _fetchItems() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      List items = await albumsController.fetchAllAlbums(_page, 10);
      setState(() {
        _items.addAll(items);
        _page++;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Albums',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: _items.isNotEmpty
          ? AnimationLimiter(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(screenWidth / 30),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: _isLoading ? _items.length + 1 : _items.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index != _items.length) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 2500),
                          child: AlbumListItem(
                            albumTitle: _items[index].title,
                            id: _items[index].id,
                          ),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: LoadingAnimationWidget.waveDots(
                        color: Colors.black,
                        size: 60,
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.black,
                size: 100,
              ),
            ),
    );
  }
}
