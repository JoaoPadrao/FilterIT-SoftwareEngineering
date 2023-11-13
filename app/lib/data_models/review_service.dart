import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_it/data_models/review.dart';

class ReviewService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addReview(Review review) {
    return _db.collection('reviews').add(review.toMap());
  }

  Stream<double> getJobAverageRatingStream(int jobId) {
    return _db
        .collection('reviews')
        .where('jobId', isEqualTo: jobId)
        .snapshots()
        .map((querySnapshot) {
      if (querySnapshot.size == 0) {
        return 0.0;
      }

      final totalRatings = querySnapshot.docs
          .map((doc) => Review.fromMap(doc.data(), doc.id).rating)
          .reduce((value, element) => value + element);

      return totalRatings / querySnapshot.size;
    });
  }

  Stream<List<Review>> getJobReviewsStream(int jobId) {
    return _db
        .collection('reviews')
        .where('jobId', isEqualTo: jobId)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) => Review.fromMap(doc.data(), doc.id)).toList();
    });
  }

  Stream<int> getUserReviewsCountStream(String userId) {
    return _db
        .collection('reviews')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.where((doc) => doc.data()['comment'] != '').length);
  }


  Stream<int> getUserRatingCountStream(String userId) {
    return _db
        .collection('reviews')
        .where('userId', isEqualTo: userId)
        .where('comment', isEqualTo: '')
        .snapshots()
        .map((querySnapshot) => querySnapshot.size);
  }

}