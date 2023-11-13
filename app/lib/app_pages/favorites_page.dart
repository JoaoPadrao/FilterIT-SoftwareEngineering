import 'package:filter_it/data_models/job_post.dart';
import 'package:filter_it/custom_widgets/small_fav_post_builder.dart';
import 'package:filter_it/custom_widgets/favorites_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_widgets/navigation_drawer.dart' as nav;

class FavoritesPage extends StatefulWidget{
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
  }

  void removeFavPost(JobPost jobPost){
    setState(() {
      FavoritesList.favPostsDisplay.remove(jobPost);
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: const nav.NavigationDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FavoritesList.favPostsDisplay.isEmpty
                ? Center(
                    child: Text(
                    'No results found.',
                      style: GoogleFonts.merriweatherSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                  ) 
                )
                : ListView.builder(
                    itemCount: FavoritesList.favPostsDisplay.length,
                    itemBuilder: (context, index) {
                      final jobPost = FavoritesList.favPostsDisplay[index];
                      return favPostBuilder(jobPost);
                    },
                  ),
            ),
          ],
        )
      ),
    );
  }

  Widget favPostBuilder(JobPost jobPost) => SmallFavPostBuilder(
    jobPost: jobPost,
    onDelete: () => removeFavPost(jobPost),
  );
}