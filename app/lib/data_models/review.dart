import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final int jobId;
  final int rating;
  final String comment;
  final String userId;
  final Timestamp timestamp;

  Review({
    required this.jobId,
    required this.rating,
    required this.comment,
    required this.userId,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'rating': rating,
      'comment': comment,
      'userId': userId,
      'timestamp': timestamp,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map, String id) {
    return Review(
      jobId: map['jobId'],
      rating: map['rating'],
      comment: map['comment'],
      userId: map['userId'],
      timestamp: map['timestamp'],
    );
  }
}