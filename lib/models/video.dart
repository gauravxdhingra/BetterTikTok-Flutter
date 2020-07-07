import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  final String userId;
  final String videoUrl;
  final String displayName;
  final String caption;
  final String audioName;
  final String audioSource;
  final int userFollowers;
  final int likes;
  final int comments;
  final int userPhotoUrl;

  Video({
    this.userId,
    this.videoUrl,
    this.displayName,
    this.caption,
    this.audioName,
    this.audioSource,
    this.userFollowers,
    this.likes,
    this.comments,
    this.userPhotoUrl,
  });

  factory Video.fromDocument(DocumentSnapshot doc) {
    return Video(
      userId: doc['userId'],
      videoUrl: doc['videoUrl'],
      displayName: doc['displayName'],
      caption: doc['caption'],
      audioName: doc['audioName'],
      audioSource: doc['audioSource'],
      userFollowers: doc['userFollowers'],
      likes: doc['likes'],
      comments: doc['comments'],
      userPhotoUrl: doc['userPhotoUrl'],
    );
  }

// TODO: Comments for video - other class

}
