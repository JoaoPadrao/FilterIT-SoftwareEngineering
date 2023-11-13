import 'package:filter_it/data_models/job_post.dart';



class FavoritesList {
  static List<JobPost> favPostsDisplay = [];

  static void addFavPost(JobPost jobPost){
    favPostsDisplay.add(jobPost);
  }

  static bool isFavPost(JobPost jobPost){
    for (var favPost in favPostsDisplay){
      if (favPost == jobPost){
        return true;
      }
    }
    return false;
  }

  static void removeFavPost(JobPost jobPost){
    favPostsDisplay.remove(jobPost);
  }
}